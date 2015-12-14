#!/usr/bin/env python

#this is for a node which takes in at least one input, and responds to it with any number of outputs. All of our nodes follow (in general) this means

#import statements for most of the messages we will need
import sys
import tf
import cv2, time
from tf2_msgs.msg import TFMessage
import rospy
from std_msgs.msg import String 
import skimage.io as skio
# from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
# import exp_quat_func as eqf
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import img_tt
from image_to_grid.msg import filteredImage
import numpy as np
import matplotlib.pyplot as plt

COMPRESSION_FACTOR = 3

command_line_vars = None

#initialize global variables to transfer information to the response
globalVar = None

#define the publishers
pub = None

# if we load any results from file, then initialize
last_image = None
last_image_filtered = None
bridge = CvBridge()
        
#Define the callback method which is called whenever this node receives a 
#message on its subscribed topic. The received message is passed as the 
#first argument to callback().
def callback(message):
    global last_image
    #assign globalvariables, we almost always need this
    try:
        cv_image = bridge.imgmsg_to_cv2(message, "rgb8")
    except CvBridgeError as e:
        print(e)
    # print cv_image
    last_image = np.asarray(cv_image)

#Define the method which contains the node's main functionality
def responder():
    global last_image_filtered
    # initalize the publishers
    pub = rospy.Publisher('/filtered_image', filteredImage, queue_size=10)

    rospy.init_node('image_processor', anonymous=True)

    # subscriber to at least one 
    rospy.Subscriber("usb_cam/image_raw", Image, callback)
    r = rospy.Rate(.5) # 5sec
    while not rospy.is_shutdown():
        #publish on all of my publishing topics
        # pub.publish(pub_string)
        if last_image is not None:
            print "image found"
            height, width, last_image_filtered = img_tt.run_process(last_image, COMPRESSION_FACTOR)
            # last_image_filtered = last_image_filtered[::-1]
            
            # skio.imshow(last_image)
            # skio.show()
            # skio.imshow(last_image_filtered)
            # skio.show()
            # gzum = grid.astype(float)
            # res = last_image_filtered.astype(bool).flatten().reshape(width, height)
            # plt.imshow(res, interpolation='nearest', origin='lower')
            # plt.pause(.001)
            # plt.show(block=False)

            pub.publish(filteredImage(last_image_filtered.astype(bool).flatten().tolist(), height, width, COMPRESSION_FACTOR))
        else:
            print "image not found"
        r.sleep()
    rospy.signal_shutdown("should be dead")

#process some input from the user
def userfn():
    ros_img_msg = last_image_service().image_data

    # Convert the ROS message to a NumPy image
    np_image = ros_to_np_img(ros_img_msg)

    # Display the CV Image
    cv2.imshow("CV Image", np_image)

    # Tell OpenCV that it should call 'on_mouse_click' when the user
    # clicks the window. This will add clicked points to our list
    cv2.setMouseCallback("CV Image", userfn, param=1)



#Python's syntax for a main() method
if __name__ == '__main__':
    responder()
