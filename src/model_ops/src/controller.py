#!/usr/bin/env python

#this is for a node which takes in at least one input, and responds to it with any number of outputs. All of our nodes follow (in general) this means

#import statements for most of the messages we will need
import sys
# import cv2, time
import rospy
# from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
# import exp_quat_func as eqf
from sensor_msgs.msg import Image
from image_to_grid.msg import pixelxy
from model_ops.msg import startGoal, doneWith, model
from cv_bridge import CvBridge, CvBridgeError
import numpy as np




#initialize global variables to transfer information to the response
explored = None
frontier = None
blob_visited = None
the_chosen_one = None
blobs_x = None
blobs_y = None
start = True
currentPos = None
x_com = None
y_com = None
backup_x = None
backup_y = None

# if we load any results from file, then initialize
loaded_results = None


def state_map(): #0 if not visited, 1 if visited
    # coords = np.empty([4,4])
    # coords[0,0] = objs_des.min(axis=0)[0]
    # coords[0,1] = objs_des.min(axis=0)[1]
    # coords[1,0] = objs_des.min(axis=0)[0]
    # coords[1,1] = objs_des.max(axis=0)[1]
    # coords[2,0] = objs_des.max(axis=0)[0]
    # coords[2,1] = objs_des.min(axis=0)[1]
    # coords[3,0] = objs_des.max(axis=0)[0]
    # coords[3,1] = objs_des.max(axis=0)[1]
    # for i in len(objs_des):
    #     distance = np.linalg.norm(objs_des.coords(i)-currentPos)
    #     if distance <= 3:
    #         state_pos = 'atpos'            
    #         break
    #     else:
    #         state_pos = 'notthere'
    #         continue
    state_map = np.empty((12,12),int)
    if state_map[currentPos[0],currentPos[1]] == 0:
        state_map[currentPos[0],currentPos[1]] = 1
    # if state_pos == 'notthere':
    #     bellman(currentPos,objs_des)
    # else:
    #     explorer(currentPos,objs_des)
      
# def callback_pos(msg):
#     # global rw_des
#     global zumyRBT
#     global currentPos
#     zumyRBT = msg
#     currentPos = zumyRBT[0:2,3]

def callback_blob_xy(msg):
    global start
    global blobs_x
    global blobs_y
    global currentPos
    idx = 0
    # count = 0
    # for i in range(len(msg)):
    #     if msg[i] == -1:
    #         count = count + 1
    currentPos = (msg.zumyX, msg.zumyY)
    if msg.dirty or blobs_x is None:
        blobs_x = []
        for i in range(len(msg.objLstx)):
            if msg.objLstx[i]==-1:
                blobs_x.append(np.array(msg.objLstx[idx:i]))
                idx = i+1
        blobs_y = []
        idx = 0
        for i in range(len(msg.objLstx)):
            if msg.objLsty[i]==-1:
                blobs_y.append(np.array(msg.objLsty[idx:i]))
                idx = i+1
        print 'blobs_x'+str(blobs_x)
        if start:
            blob_chooser(blobs_x, blobs_y)
            start = False
# def combiner(blobs_x,blobs_y):
#     global blobs
#     if len(blobs_x) == len(blobs_y):
#         for i in range(len(blobs_x)):
#             blobs[i]
def blob_com(blobs_x,blobs_y):
    global x_com
    global y_com
    x_com = []
    y_com = []
    for i in range(len(blobs_x)):
        x_com.append(np.floor(np.sum(blobs_x[i])/blobs_x[i].shape[0]))
    for j in range(len(blobs_x)):
        y_com.append(np.floor(np.sum(blobs_y[i])/blobs_y[i].shape[0]))

def blob_chooser(blobs_x,blobs_y):
    global backup_x
    global backup_y
    global idx
    global the_chosen_one
    # blob_visited = np.array((1,len(blobs_x)))
    dist = 1000;
    idx = -1
    # print 'x:' + str(blobs_x)
    # print 'y:' + str(blobs_y)
    blob_com(blobs_x, blobs_y)
    # print x_com
    # print y_com
    for i in range(len(blobs_x)):
        distance = np.linalg.norm(np.asarray([currentPos[0]-x_com[i],currentPos[1]-y_com[i]]))
        if distance < dist:
            dist = distance
            idx = i
    the_chosen_one_x = blobs_x[idx].T
    the_chosen_one_y = blobs_y[idx].T
    leng = the_chosen_one_x.shape[0]
    # print leng
    the_chosen_one = np.hstack((the_chosen_one_x.reshape(leng, 1),the_chosen_one_y.reshape(leng,1)))
    backup_x = blobs_x[idx]
    backup_y = blobs_y[idx]
    print 'the chosen blob to visit'
    print the_chosen_one
    del blobs_x[idx]
    del blobs_y[idx]
    # print the_chosen_one


def callback_subs_done(msg):
    # global reached

    done = msg.done
    withX = msg.withX
    withY = msg.withY
    # blob_visited[idx] = 1
    # reached = True
    if backup_x == withX and backup_y == withY:
        blob_chooser(blobs_x,blobs_y)

# def get_next_blob(blobs_x,blobs_y):
#     global backup_x
#     global backup_y
#     dist = 1000;
#     idx = -1
#     for i in range(len(blob_x)):
#         distance = np.linalg.norm(currentPos-np.array([[x_com[i]],[y_com[i]]]))
#         if distance < dist:
#             dist = distance
#             idx = i
#     the_chosen_one_x = blob_x[idx].T
#     the_chosen_one_y = blob_y[idx].T
#     the_chosen_one = np.hstack(the_chosen_one_x,the_chosen_one_y)
#     backup_x = blobs_x[idx]
#     backup_y = blobs_y[idx]
#     del blobs_x[idx]
#     del blobs_y[idx]

#Python's syntax for a main() method
if __name__ == '__main__':

    # state = '' #navigating or exploring
    # currentPos #zumy current position
    # objs #list of objects
    # objs_des #current desired position, should have 4 coordinates corresponding to corners
    

    rospy.init_node('controller')

    # if len(sys.argv) < 2:
    #     print('Use: controller.py [currentPos] [objs_des] [zumyname]')
    #     sys.exit()
#==============================================================================
#     ar_tags = {}
#     ar_tags['ar0'] = 'ar_marker_' + sys.argv[1]
#     ar_tags['ar1'] = 'ar_marker_' + sys.argv[2]
#     ar_tags['arZ'] = 'ar_marker_' + sys.argv[3]
#==============================================================================
    # currentPos = sys.argv[1]
    # objs_des = sys.argv[2]
    zumyname = sys.argv[1]
    # listener = tf.TransformListener()
    pub = rospy.Publisher('/'+zumyname+'/object_to_find', pixelxy, queue_size = 10)
    subs_done = rospy.Subscriber('/'+zumyname+'/complete', doneWith, callback_subs_done)
    # subs_state = rospy.Subscriber('/at_pos',int,callback_reached)
    # subs_current_pos = rospy.Subscriber('/'+zumyname+'/state_estimate', Transform, callback_state)
    subs_blob = rospy.Subscriber('/'+zumyname+'/model', model, callback_blob_xy)
    # subs_blob_y = rospy.Subscriber('/'+zumyname+'/model', model, callback_bloby)
    rate = rospy.Rate(1.0)
    while not rospy.is_shutdown():
        objs_des = the_chosen_one
        # combiner(blobs_x,blobs_y)
        try:
            # print "objdes" + str(objs_des[0])
            pub.publish(pixelxy(objs_des[0,0], objs_des[0,1]))
            # print 'objs_des'
            # print objs_des
            # controller(currentPos,objs_des)
        except Exception as e:
            # print 'Insufficient Data: controller, ' + str(e)
            
            pass