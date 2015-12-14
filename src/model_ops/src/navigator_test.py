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
# import exp_quat_func as eqf
from sensor_msgs.msg import Image
from std_msgs.msg import Bool
from model_ops.msg import startGoal, model, doneWith
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import pathplanner as pth



command_line_vars = None

#initialize global variables to transfer information to the response
start = None
goal = None
updated = True
stop = True

need_next = False
path = None

grid = None
grid_size = None
dirty = False


#define the publishers
directions = None
next_dest = None


    
#Define the callback method which is called whenever this node receives a 
#message on its subscribed topic. The received message is passed as the 
#first argument to callback().
def begin_explore(message):
    global start
    global goal
    global updated
    global stop

    nstart = (message.sx, message.sy)
    ngoal = (message.gx, message.gy)

    if start is None or goal is None or nstart != start or ngoal != goal:
        #we are starting a new navigation
        if message.sx == -1:
            stop = True
        else:
            stop = False
        start = nstart
        goal = ngoal
        updated = False


def update_next(message):
    global need_next
    
    if goal is not None and message.withX != goal[0] and message.withY != goal[1]:
        need_next = message.done

def update_model(msg):
    global grid
    global grid_size
    global dirty

    grid_size = msg.length
    grid = np.asarray(msg.grid).reshape(msg.length, msg.width)
    dirty = msg.dirty


#Define the method which contains the node's main functionality
def responder(name):
    global path
    global start
    global goal
    global grid
    global need_next
    last = None
    current = None
    # initalize the publishers
    directions = rospy.Publisher('/'+ zumy_name + "/next_cell", startGoal, queue_size=10)
    next_dest = rospy.Publisher('/'+ zumy_name + "/nav_complete", doneWith, queue_size=10)

    rospy.init_node('navigator', anonymous=True)

    r = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():

        #publish on all of my publishing topics
        if not stop:
            if not updated or dirty:
                # start a new path
                path = pth.gen_path(start, goal, grid)
                print path, start, goal
                last = 0
                current = 0
            elif need_next:
                # send the next location in the path
                last = current
                current += 1
                need_next = False
            # keep resending the old directions
            if current == len(path):
                next_dest.publish(doneWith(True, goal[0], goal[1]))
            else:
                print path[current]
                directions.publish(path[last][0], path[last][1], path[current][0], path[current][1])
            
        r.sleep()
    rospy.signal_shutdown("should be dead")


#Python's syntax for a main() method
if __name__ == '__main__':

    # extract any of our command line args here
    zumy_name = sys.argv[1]

    # loaded_results = load("filename")

    # user actions (copied homography stuff) This blocks until the user responds
    # raw_input('Press enter to capture an image:')
    # userfn()
    rospy.Subscriber('/'+ zumy_name + "/nav_to", startGoal, begin_explore)
    rospy.Subscriber('/'+ zumy_name + "/reached", doneWith, update_next)
    rospy.Subscriber('/'+ zumy_name + "/model", model, update_model)


    responder(zumy_name)