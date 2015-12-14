#!/usr/bin/env python

#this is for a node which takes in at least one input, and responds to it with any number of outputs. All of our nodes follow (in general) this means

#import statements for most of the messages we will need
import sys
# import tf
# import cv2, time
# from tf2_msgs.msg import TFMessage
import rospy
# from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
import exp_quat_func as eqf
from sensor_msgs.msg import Image
from image_to_grid.msg import toTarget, gridZumy, homographies
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from model_ops.msg import model
import value as val




#initialize global variables to transfer information to the response
grid = None
glen = None
gwid = None
zpos = None
dirty = False

skip = 0

target = None
length = None
objlst = []

zumy_at = None
#define the publishers
model_out = None

def find_object(grid):
    '''
    Finds all contiguous sections of ones and returns as a list of lists
    '''
    objec_locs = set()
    objects = []
    l, w = grid.shape
    for i in range(l):
        for j in range(w):
            if (i,j) not in objec_locs:
                if grid[i,j] == 1:
                    newobj = []
                    frontier = {(i,j)}
                    while len(frontier) != 0:
                        exp = frontier.pop()
                        objec_locs = objec_locs | {exp}
                        adjlst = val.adjacent(grid, exp)
                        newobj.append(list(exp))
                        for adj in adjlst:
                            if grid[adj] == 1 and adj not in objec_locs:
                                frontier = frontier | {adj}
                        # print frontier
                    objects.append(newobj)
    return objects





#Define the callback method which is called whenever this node receives a 
#message on its subscribed topic. The received message is passed as the 
#first argument to callback().
def grid_updates(msg):
    global grid
    global glen
    global gwid
    global zpos
    global objlst
    global dirty

    zpos = (msg.zumy.x, msg.zumy.y)
    glen = msg.image.length
    gwid = msg.image.width
    ngrid = np.asarray(msg.image.image).reshape(glen, gwid)
    if grid is not None:
        dirty = not np.array_equal(grid, ngrid)
    else:
        dirty = True

    grid = ngrid
    # print grid
    if dirty:
        objlst = []
        objs = find_object(grid)
        for obj in objs:
            objlst = objlst + obj
            objlst.append([-1,-1])
    dirty = False
    objlst = np.asarray(objlst)
    # print len(objlst)


def callback_homo(msg):
    global length
    length = msg.intervalSize

def target_found(msg):
    global target
    global zumy_at

    target = msg.target.translation.z
    zumy_at = msg.zumy
    # print target
    # print "zumyat: " + str(zumy_at)

def compute_target(target, zumy_cf):
    # print target, zumy_cf
    o1, t1 = eqf.quaternion_to_exp(np.array([zumy_cf.rotation.x, zumy_cf.rotation.y, zumy_cf.rotation.z, zumy_cf.rotation.w]))
    rb_cur = eqf.create_rbt(o1, t1, np.array([zumy_cf.translation.x, zumy_cf.translation.y, zumy_cf.translation.z]))
    # print np.dot(rb_cur, np.asarray([target, 0,0,1]).reshape(4,1))
    return np.dot(rb_cur, np.asarray([target, 0,0,1]).reshape(4,1))
#Define the method which contains the node's main functionality
def responder(zumy_name):
    global target
    rospy.init_node('update_model', anonymous=True)

    # initalize the publishers
    pub = rospy.Publisher('/' + zumy_name + '/model', model, queue_size=10)


    # subscriber to at least one 
    r = rospy.Rate(3) # 10hz
    while not rospy.is_shutdown():
        # print grid
        #publish on all of my publishing topics
        if zpos is not None:
            # print grid
            
            if len(objlst) != 0:
                if target is None:
                    # print objlst[:,0]
                    # print objlst
                    pub.publish(model(glen, gwid, grid.flatten().tolist(), zpos[0], zpos[1],
                    objlst[:,0].tolist(), objlst[:,1].tolist(), dirty, -1, -1))
                else:
                    if length != None:
                        # print objlst[:,1]
                        ztarget = compute_target(target, zumy_at)
                        pub.publish(model(glen, gwid, grid.flatten().tolist(), zpos[0], zpos[1],
                        objlst[:,0].tolist(),  objlst[:,1].tolist(), dirty,
                        ztarget[0], ztarget[1]))
                         # int(round((ztarget[0] - length/2.0)/length)), int(round((ztarget[1] - length/2.0)/length))))
            else:
                # pub.publish(model(glen, gwid, grid.flatten().tolist(), zpos[0], zpos[1],
                # [], [], dirty, target[0], target[1]))
                target = None

        r.sleep()
    rospy.signal_shutdown("should be dead")


#Python's syntax for a main() method
if __name__ == '__main__':

    # extract any of our command line args here
    zumy_name = sys.argv[1]

    rospy.Subscriber('/'+zumy_name +"/grid_with_zumy", gridZumy, grid_updates)
    rospy.Subscriber('/' + zumy_name + "/target_transform", toTarget, target_found)
    subs_homo = rospy.Subscriber('/homography_out', homographies, callback_homo)


    responder(zumy_name)
