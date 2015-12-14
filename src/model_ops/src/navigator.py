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
from model_ops.msg import startGoal, startGoalCentroid, model, doneWith
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
import pathplanner as pth
import matplotlib.pyplot as plt



command_line_vars = None

#initialize global variables to transfer information to the response
start = None
goal = None
cent = None
updated = False
stop = True
current = 0

need_next = False
path = None

grid = None
grid_size = None
dirty = False
zumy = None
target = None


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
    global cent

    nstart = (message.sx, message.sy)
    ngoal = (message.gx, message.gy)
    cent = (message.cx, message.cy)

    # print nstart, ngoal, start, goal

    if start is None or goal is None or (ngoal[0] != goal[0] or ngoal[1] != goal[1]):
        #we are starting a new navigation
        # print "getting new exploration"
        if message.sx == -1:
            stop = True
        else:
            stop = False
        start = nstart
        goal = ngoal
        updated = True
        # print start, goal


def update_next(message):
    global need_next, stop, cent
    # print message.withX, message.withY
    # print path, current


    if current >= len(path):
        # print "done exploring"
        if current == len(path):
            if message.withX == -2 and message.withY == -2:
                need_next = message.done
        return;
    print zumy
    if (goal is not None and path is not None 
        and message.withX == path[current][0] 
        and message.withY == path[current][1]
        and message.withX == zumy[0] 
        and message.withY == zumy[1]):
        # print "need next: "  + str(need_next)
        need_next = message.done
        return;
    # print "not done, not updating"


def update_model(msg):
    global grid
    global grid_size
    global dirty
    global zumy
    global target

    if msg.foundX != -1:
        target = (msg.foundX, msg.foundY)

    # print "grid: " + str((msg.zumyX, msg.zumyY))
    zumy = (msg.zumyX, msg.zumyY)

    grid_size = msg.length
    grid = np.asarray(msg.grid).reshape(msg.length, msg.width)
    dirty = msg.dirty


#Define the method which contains the node's main functionality
def responder(name):
    global path, start, goal, grid, need_next, updated, current, stop
    current += 1
    last = None
    # initalize the publishers
    directions = rospy.Publisher('/'+ zumy_name + "/next_cell", startGoal, queue_size=10)
    next_dest = rospy.Publisher('/'+ zumy_name + "/nav_complete", doneWith, queue_size=10)

    rospy.init_node('navigator', anonymous=True)

    r = rospy.Rate(3) # 10hz
    while not rospy.is_shutdown():

        #publish on all of my publishing topics
        # print updated
        # print grid
        # if zumy is not None:
            # print "grid zumy: " + str((zumy[0], zumy[1]))
        if grid is not None and updated:
            # start a new path
            path = pth.gen_path(start, goal, grid)
            print 'path'+str(path)
            # print 'path, start, goal from explorer: ' + str((path, start, goal))
            # print path, start, goal
            last = 0
            current = 0
            updated = False
            stop = False
        elif not stop:
            if need_next:
                # send the next location in the path
                # print current
                last = current
                current += 1
                need_next = False
            # keep resending the old directions
            if current >= len(path):
                # print "current"
                # print current
                if current == len(path) and cent is not None:
                    print "turn_directive"
                    # plt.imshow(grid, interpolation='nearest')
                    # plt.pause(.001)
                    # plt.show(block=False)
                    directions.publish(startGoal(-2, -2, cent[0], cent[1]))
                else:
                    print "done"
                    directions.publish(startGoal(-3, -3, 3, 3))
                    next_dest.publish(doneWith(True, goal[0], goal[1]))
            else:
                print "current: " + str(path[current])
                gzum = grid.astype(float)
                for pnt in path[current:]:
                    gzum[pnt] = .75
                gzum[zumy] = .5
                plt.imshow(gzum, interpolation='nearest', origin ='lower')
                plt.pause(.001)
                plt.show(block=False)
                # print 'path[current], current dest'
                # print "path current: " + str(path[current])
                # directions.publish(path[last][0], path[last][1], 3, 3)

                directions.publish(path[last][0], path[last][1], path[current][0], path[current][1])
                # directions.publish(3,3,1,1)

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
    rospy.Subscriber('/'+ zumy_name + "/nav_to", startGoalCentroid, begin_explore)
    rospy.Subscriber('/'+ zumy_name + "/reached", doneWith, update_next)
    rospy.Subscriber('/'+ zumy_name + "/model", model, update_model)


    responder(zumy_name)