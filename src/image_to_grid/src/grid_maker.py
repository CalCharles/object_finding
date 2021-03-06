#!/usr/bin/env python

#this is for a node which takes in at least one input, and responds to it with any number of outputs. All of our nodes follow (in general) this means

#import statements for most of the messages we will need
import math
import sys
import tf
import cv2, time
from tf2_msgs.msg import TFMessage
import rospy
# from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
# import exp_quat_func as eqf
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from image_to_grid.msg import filteredImage, gridZumy, homographies, pixelxy
import numpy as np
import skimage.io as skio
import matplotlib.pyplot as plt


command_line_vars = None

#initialize global variables to transfer information to the response
# call global when assigned in function
grid_size = 12

#object black and white image
fimage = None
factor = None

# Homography global variable
floorx = None
floory = None
objx = None
objy = None
length = None
homography_aquired = False

# zumy location global variable
# seen = 0
zumyxy = None
zumy_angle = None
# averages = (None, None, None)

#define the publishers
pub = None

# if we load any results from file, then initialize
loaded_results = None
    
#Define the callback method which is called whenever this node receives a 
#message on its subscribed topic. The received message is passed as the 
#first argument to callback().
def img_processor_callback(message):
    global fimage
    global factor
    #assign globalvariables, we almost always need this
    fimage = np.asarray(message.image).reshape(message.length, message.width).T
    # skio.imshow(fimage)
    # skio.show()
    factor = message.comp_factor

    # "put more globalvar assignments here"

# def zumy_tag_callback(message):
#     global zumyxy
#     global zumy_angle

#     zumyxy = (message.translation.x, message.translation.y)
#     zumy_angle = message.rotation.w


def kalman_location_callback(message):
    global zumyxy
    global zumy_angle

    zumyxy = (message.translation.x, message.translation.y)
    zumy_angle = message.rotation.w

def homography_callback(msg):
    global homography_aquired
    global floorx
    global floory
    global objy
    global objx
    global length
    global grid_size

    # assert (msg.size == grid_size), "all grids size must match"
    grid_size = msg.size
    homography_aquired = True
    floorx = np.asarray(msg.floorX).reshape(msg.size+1, msg.size+1)
    # print floorx
    floory = np.asarray(msg.floorY).reshape(msg.size+1, msg.size+1)
    # print floory
    objx = np.asarray(msg.objectX).reshape(msg.size+1, msg.size+1)
    objy = np.asarray(msg.objectY).reshape(msg.size+1, msg.size+1)
    # print objy
    # print objx
    length = msg.intervalSize

def get_lines(corners):
    # print corners
    def line_tp(p1, p2):
        return lambda x: (float((p2[1]-p1[1]))/(p2[0]-p1[0])*(x-p1[0]) + p1[1])

    return (line_tp(corners[0], corners[1]),
            line_tp(corners[2], corners[0]),
            line_tp(corners[2], corners[3]),
            line_tp(corners[3], corners[1]))

def get_extents(corners):
    return ((corners[0][0], corners[1][0]),
            (corners[2][0], corners[0][0]),
            (corners[2][0], corners[3][0]),
            (corners[3][0], corners[1][0]))

def get_contained(arr, lines, extents):
    found = []
    for i in range(extents[1][0], extents[1][1]):
        if i < extents[2][1]:
            # print i, lines[1](i1), lines[2](i)
            for j in range(int(lines[2](i)), int(math.ceil(lines[1](i)))+1):
                found.append((arr[i,j]))
        else:
            # print lines[1](i), lines[3](i)
            for j in range(int(lines[3](i)), int(math.ceil(lines[1](i)))):
                found.append((arr[i,j]))
    for i in range(extents[0][0], extents[0][1]):
        if i < extents[2][1]:
            for j in range(int(lines[2](i)), int(math.ceil(lines[0](i)))+1):
                found.append((arr[i,j]))
        else:
            for j in range(int(lines[3](i)), int(math.ceil(lines[0](i)))):
                found.append((arr[i,j]))
    return found

def objects_on_grid():
    grid = np.asarray([[0 for _ in range(int(grid_size))] for b in range(int(grid_size))])
    for x in range(grid_size):
        for y in range(grid_size):
            corners = ((objx[x,y]/3, objy[x,y]/3), 
                        (objx[x+1,y]/3, objy[x+1,y]/3),
                        (objx[x,y+1]/3, objy[x,y+1]/3),
                        (objx[x+1,y+1]/3, objy[x+1,y+1]/3))
            # currently, we are sequential, could be improved
            lines = get_lines(corners)
            extents = get_extents(corners)
            vals = get_contained(fimage, lines, extents)
            # print corners
            # print vals
            volume = len(vals)
            object_votes = np.sum(vals)
            # print corners, x, y, object_votes, extents, vals
            if object_votes/float(volume) > .1:
                grid[x,y] = 1
    distance = length * grid_size
    # grid = grid.T
    # grid = [grid[i,::-1] for i in grid]
    # grid = [grid[i,::-1].tolist() for i in range(grid_size)]
    # grid = grid[::-1,:]
    # print grid
    # error
    # error
    return np.asarray(grid)




#Define the method which contains the node's main functionality
def responder(zumy_name):
    # initalize the publishers
    grid = [[0 for _ in range(grid_size)] for b in range(grid_size)]

    pub = rospy.Publisher("/" + zumy_name + "/grid_with_zumy", gridZumy, queue_size=10)
    r = rospy.Rate(4) # 10hz
    counter = 0
    grid = None
    while not rospy.is_shutdown():

        #publish on all of my publishing topics
        # pub.publish(griZumy(   ))
        # print fimage
        # print "z"+ str(zumyxy)
        # print "h" + str(homography_aquired)
        if fimage is not None and zumyxy is not None and homography_aquired:
            if counter > 12 or counter == 0:
                print "new grid"
                grid = objects_on_grid()
                counter = 0

            zumy = (int(round((zumyxy[0] - length/2.0)/length)), int(round((zumyxy[1] - length/2.0)/length)))
            print zumy
            counter += 1

            # print "zumy: " + str(zumyxy)
            # withZumy = grid.copy().astype(float)
            # print "hello"
            # print zumyxy
            # print zumy
            # if zumy[0] < grid_size and zumy[1] < grid_size:
            #     print zumy
            #     withZumy[zumy[0], zumy[1]] = .5
            # withZumy[1,1] = .5
            # print withZumy

            # ffim = fimage.copy().T
            # redobjx = objx/3
            # redobjy = objy/3
            # for x in range(13):
            #     for y in range(13):
            #         ffim[redobjx[x,y],redobjy[x,y]] = 1
            #         ffim[redobjx[x,y]+1,redobjy[x,y]] = 1
            #         ffim[redobjx[x,y],redobjy[x,y]+1] = 1
            #         ffim[redobjx[x,y]+1,redobjy[x,y]+1] = 1
            # plt.imshow(ffim, interpolation='nearest', origin='lower')
            # plt.pause(.001)
            # plt.show(block=False)


            gzum = grid.astype(float)
            gzum[zumy] = .5
            plt.imshow(gzum, interpolation='nearest', origin='lower')
            plt.pause(.001)
            plt.show(block=False)
            pub.publish(gridZumy(pixelxy(zumy[0], zumy[1]),
            filteredImage(grid.astype(bool).flatten().tolist(), 
            grid_size, grid_size, -1.0)))
        r.sleep()
    rospy.signal_shutdown("should be dead")

# #process some input from the user
# def userfn():
#     ros_img_msg = last_image_service().image_data

#     # Convert the ROS message to a NumPy image
#     np_image = ros_to_np_img(ros_img_msg)

#     # Display the CV Image
#     cv2.imshow("CV Image", np_image)

#     # Tell OpenCV that it should call 'on_mouse_click' when the user
#     # clicks the window. This will add clicked points to our list
#     cv2.setMouseCallback("CV Image", userfn, param=1)



#Python's syntax for a main() method
if __name__ == '__main__':

    # extract any of our command line args here
    zumy_name = sys.argv[1]

    # loaded_results = load("filename")

    # user actions (copied homography stuff) This blocks until the user responds
    # raw_input('Press enter to capture an image:')
    # userfn()

    rospy.init_node('grid_maker', anonymous=True)

    # subscriber to at least one 
    rospy.Subscriber("/filtered_image", filteredImage, img_processor_callback)
    rospy.Subscriber("/homography_out", homographies, homography_callback)
    rospy.Subscriber("/" + zumy_name + "/state_estimate", Transform, kalman_location_callback)

    responder(zumy_name)
    rospy.signal_shutdown("should be dead")
