#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Image
from lab4_cam.srv import ImageSrv, ImageSrvResponse
import cv2, time, sys
from cv_bridge import CvBridge, CvBridgeError
import numpy as np
from numpy.linalg import *
import math

import sys
import tf
import cv2, time
from tf2_msgs.msg import TFMessage
import rospy
from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
from sensor_msgs.msg import Image
from image_to_grid.msg import homographies

# floorToPixel = None
# pixelToFloor = None
# objectToPixel = None
# pixelToObject = None
size = None

floorx = None
floory = None
objx = None
objy = None

#pub = homographies_out

# Nominal length of a tile side
GRID_LENGTH = .3048/4 #cm
GRID_SIZE = 12

# Helper function to check computed homography
# This will draw dots in a grid by projecting x,y coordinates
# of tile corners to u,v image coordinates
def check_homography(image, H, nx, ny, length=GRID_LENGTH):
  # H should be a 3x3 numpy.array
  # nx is the number of tiles in the x direction
  # ny is the number of tiles in the y direction
  # length is the length of one side of a tile
  # image is an image array
  #floorX = np.empty((13,0))
  #floorY = np.empty((0,0))
  floorX = []
  floorY = []
  objectX = []
  objectY = []
  for i in range(nx+1):
    floorXcol = []
    floorYcol = []
    objectXcol = []
    objectYcol = []
    for j in range(ny+1):
      xbar = np.array([[i*length],[j*length],[1]])
      ubar = np.dot(H,xbar).T[0]
      xbar2 = np.array([[i*length],[j*length],[1]])
      ubar2 = np.dot(H2,xbar).T[0]
      u = np.int(ubar[0]/ubar[2])
      v = np.int(ubar[1]/ubar[2])
      u2 = np.int(ubar2[0]/ubar2[2])
      v2 = np.int(ubar2[1]/ubar2[2])
      uv_out = np.array([[u],[v]])
      uv_out2 = np.array([[u2],[v2]])

      floorXcol.append(u)
      floorYcol.append(v)
      objectXcol.append(u2)
      objectYcol.append(v2)
      # print 'Dot location: ' + str((u,v))
      #print uv_out
      #print xy
      #print uv_out2
      #print xy2
      cv2.circle(image, (u,v), 5, 0, -1)
      cv2.circle(image, (u2,v2), 5, (0,255,0), -1)
      # print floorXcol
      # print floorX
      # print floorXcol.size
      # print floorX.size
    floorX.append(floorXcol)
    floorY.append(floorYcol)
    # floorY = [floorYcol[::-1]] + floorY
    objectX.append(objectXcol)
    objectY.append(objectYcol)
    # objectY = [objectYcol[::-1]] + objectY
  cv2.imshow('Check Homography', image)
  print np.asarray(floorX)
  print np.asarray(floorY)
  print np.asarray(objectX)
  print np.asarray(objectY)
  # floorXr = np.asarray(objectX).T.flatten().tolist()
  # floorYr = np.asarray(objectY).T.flatten().tolist()
  # objectXr = np.asarray(floorX).T.flatten().tolist()
  # objectYr = np.asarray(floorY).T.flatten().tolist()  
  floorXr = np.asarray(floorX).T.flatten().tolist()
  floorYr = np.asarray(floorY).T.flatten().tolist()
  objectXr = np.asarray(objectX).T.flatten().tolist()
  objectYr = np.asarray(objectY).T.flatten().tolist()
  return floorXr, floorYr, objectXr, objectYr, image
# Create a CvBridge to convert ROS messages to OpenCV images
bridge = CvBridge()

# Converts a ROS Image message to a NumPy array to be displayed by OpenCV
def ros_to_np_img(ros_img_msg):
  return np.array(bridge.imgmsg_to_cv2(ros_img_msg,'bgr8'))

# Define the total number of clicks we are expecting (4 corners)
TOT_CLICKS = 8

if __name__ == '__main__':
  
  # Waits for the image service to become available
  rospy.wait_for_service('last_image')
  
  # Initializes the image processing node
  rospy.init_node('homography_generator')
  
  # Creates a function used to call the 
  # image capture service: ImageSrv is the service type
  last_image_service = rospy.ServiceProxy('last_image', ImageSrv)

  # Create an empty list to hold the coordinates of the clicked points
  points = []

  # Callback function for 'cv2.SetMouseCallback' adds a clicked point to the
  # list 'points'
  def on_mouse_click(event,x,y,flag,param):
    if(event == cv2.EVENT_LBUTTONUP):
      point = (x,y)
      print "Point Captured: " + str(point)
      points.append(point)

    # initalize the publishers
  pub = rospy.Publisher('/homography_out', homographies, queue_size=10)


  while not rospy.is_shutdown():
    try:
      # Waits for a key input to continue
      raw_input('Press enter to capture an image:')
    except KeyboardInterrupt:
      print 'Break from raw_input'
      break
    
    try:
      # Request the last image from the image service
      # And extract the ROS Image from the ImageSrv service
      # Remember that ImageSrv.image_data was
      # defined to be of type sensor_msgs.msg.Image
      ros_img_msg = last_image_service().image_data

      # Convert the ROS message to a NumPy image
      np_image = ros_to_np_img(ros_img_msg)

      # Display the CV Image
      cv2.imshow("CV Image", np_image)

      # Tell OpenCV that it should call 'on_mouse_click' when the user
      # clicks the window. This will add clicked points to our list
      cv2.setMouseCallback("CV Image", on_mouse_click, param=1)

      # Zero out list each time we have a new image
      points = []

      # Loop until the user has clicked enough points
      while len(points) < TOT_CLICKS:
        if rospy.is_shutdown():
          raise KeyboardInterrupt
        cv2.waitKey(10)

      # Convert the Python list of points to a NumPy array of the form
      #   | u1 u2 u3 u4 |
      #   | v1 v2 v3 v4 |
      uv = np.array(points).T

# === YOUR CODE HERE ===========================================================
      
      xy = np.array([[0, 0, GRID_LENGTH*GRID_SIZE, GRID_LENGTH*GRID_SIZE], [0, GRID_LENGTH*GRID_SIZE, GRID_LENGTH*GRID_SIZE, 0]])
      xy2 = np.array([[0, 0, GRID_LENGTH*GRID_SIZE, GRID_LENGTH*GRID_SIZE], [0, GRID_LENGTH*GRID_SIZE, GRID_LENGTH*GRID_SIZE, 0]])
      A = np.array([[xy[0,0],xy[1,0],1,0,0,0,-uv[0,0]*xy[0,0],-uv[0,0]*xy[1,0]],
		    [0,0,0,xy[0,0],xy[1,0],1,-uv[1,0]*xy[0,0],-uv[1,0]*xy[1,0]],
		    [xy[0,1],xy[1,1],1,0,0,0,-uv[0,1]*xy[0,1],-uv[0,1]*xy[1,1]],
	            [0,0,0,xy[0,1],xy[1,1],1,-uv[1,1]*xy[0,1],-uv[1,1]*xy[1,1]], 
		    [xy[0,2],xy[1,2],1,0,0,0,-uv[0,2]*xy[0,2],-uv[0,2]*xy[1,2]],
		    [0,0,0,xy[0,2],xy[1,2],1,-uv[1,2]*xy[0,2],-uv[1,2]*xy[1,2]],
		    [xy[0,3],xy[1,3],1,0,0,0,-uv[0,3]*xy[0,3],-uv[0,3]*xy[1,3]],
		    [0,0,0,xy[0,3],xy[1,3],1,-uv[1,3]*xy[0,3],-uv[1,3]*xy[1,3]]])
      A2 = np.array([[xy2[0,0],xy2[1,0],1,0,0,0,-uv[0,4]*xy2[0,0],-uv[0,4]*xy2[1,0]],
                     [0,0,0,xy2[0,0],xy2[1,0],1,-uv[1,4]*xy2[0,0],-uv[1,4]*xy2[1,0]],
                     [xy2[0,1],xy2[1,1],1,0,0,0,-uv[0,5]*xy2[0,1],-uv[0,5]*xy2[1,1]],
                     [0,0,0,xy2[0,1],xy2[1,1],1,-uv[1,5]*xy2[0,1],-uv[1,5]*xy2[1,1]], 
                     [xy2[0,2],xy2[1,2],1,0,0,0,-uv[0,6]*xy2[0,2],-uv[0,6]*xy2[1,2]],
                     [0,0,0,xy2[0,2],xy2[1,2],1,-uv[1,6]*xy2[0,2],-uv[1,6]*xy2[1,2]],
                     [xy2[0,3],xy2[1,3],1,0,0,0,-uv[0,7]*xy2[0,3],-uv[0,7]*xy2[1,3]],
                     [0,0,0,xy2[0,3],xy2[1,3],1,-uv[1,7]*xy2[0,3],-uv[1,7]*xy2[1,3]]])
      #A2 = np.array([[xy[0,4],xy[1,4],1,0,0,0,-uv[0,4]*xy[0,4],-uv[0,4]*xy[1,4]],
      #               [0,0,0,xy[0,4],xy[1,4],1,-uv[1,4]*xy[0,4],-uv[1,4]*xy[1,4]],
      #               [xy[0,5],xy[1,5],1,0,0,0,-uv[0,5]*xy[0,5],-uv[0,5]*xy[1,5]],
      #               [0,0,0,xy[0,5],xy[1,5],1,-uv[1,5]*xy[0,5],-uv[1,5]*xy[1,5]], 
      #               [xy[0,6],xy[1,6],1,0,0,0,-uv[0,6]*xy[0,6],-uv[0,6]*xy[1,6]],
      #               [0,0,0,xy[0,6],xy[1,6],1,-uv[1,6]*xy[0,6],-uv[1,6]*xy[1,6]],
      #               [xy[0,7],xy[1,7],1,0,0,0,-uv[0,7]*xy[0,7],-uv[0,7]*xy[1,7]],
      #               [0,0,0,xy[0,7],xy[1,7],1,-uv[1,7]*xy[0,7],-uv[1,7]*xy[1,7]]])
      b = np.array([[uv[0,0]],[uv[1,0]],[uv[0,1]],[uv[1,1]],[uv[0,2]],[uv[1,2]],[uv[0,3]],[uv[1,3]]])
      b2 = np.array([[uv[0,4]],[uv[1,4]],[uv[0,5]],[uv[1,5]],[uv[0,6]],[uv[1,6]],[uv[0,7]],[uv[1,7]]])
      h = (inv(A)).dot(b)
      h2 = (inv(A2)).dot(b2)

      # This is placeholder code that will draw a 4 by 3 grid in the corner of
      # the image
      H = np.array([[h[0,0],h[1,0],h[2,0]],[h[3,0],h[4,0],h[5,0]],[h[6,0],h[7,0],1]])
      H2 = np.array([[h2[0,0],h2[1,0],h2[2,0]],[h2[3,0],h2[4,0],h2[5,0]],[h2[6,0],h2[7,0],1]])
      nx = GRID_SIZE
      ny = GRID_SIZE

      Q = inv(H)
      Q2 = inv(H2)
      xy = np.zeros((2,4))
      xy2 = np.zeros((2,4))

      for point in range(4):
          xy[0,point] = (Q[0,0]*uv[0,point]+Q[0,1]*uv[1,point]+Q[0,2])/(Q[2,0]*uv[0,point]+Q[2,1]*uv[1,point]+Q[2,2])
          xy[1,point] = (Q[1,0]*uv[0,point]+Q[1,1]*uv[1,point]+Q[1,2])/(Q[2,0]*uv[0,point]+Q[2,1]*uv[1,point]+Q[2,2])

      for point in range(4,8):
          xy2[0,point-4] = (Q2[0,0]*uv[0,point]+Q2[0,1]*uv[1,point]+Q2[0,2])/(Q2[2,0]*uv[0,point]+Q2[2,1]*uv[1,point]+Q2[2,2])
          xy2[1,point-4] = (Q2[1,0]*uv[0,point]+Q2[1,1]*uv[1,point]+Q2[1,2])/(Q2[2,0]*uv[0,point]+Q2[2,1]*uv[1,point]+Q2[2,2])

      length = np.sqrt(pow(xy[0,0]-xy[0,1],2) + pow(xy[1,0]-xy[1,1],2))
      length2 = np.sqrt(pow(xy2[0,0]-xy2[0,1],2) + pow(xy2[1,0]-xy2[1,1],2))
      print(xy)
      print(uv)
      print(length)
# ==============================================================================
      
      # Check the produced homography matrix
      cv2.destroyAllWindows()
      global floorx
      global floory
      global objx
      global objy
      floorx, floory, objx, objy, im = check_homography(np_image, H, nx, ny)
      cv2.imshow('Check Homography', im)
      # # Loop until the user presses a key
      key = -1
      while key == -1:
        key = cv2.waitKey(10)
      raw_input('Press enter to continue: ')
      cv2.destroyAllWindows()
      r = rospy.Rate(.2) # 10hz
      while not rospy.is_shutdown():

        #publish on all of my publishing topics
        # print "publishing"
        # print objy
        pub.publish(homographies(floorx, floory, objx, objy, GRID_SIZE, GRID_LENGTH))

        r.sleep()
      

    except KeyboardInterrupt:
      print 'Keyboard Interrupt, exiting'
      break

    # Catch if anything went wrong with the Image Service
    except rospy.ServiceException, e:
      print "image_process: Service call failed: %s"%e

  # # When done, get rid of windows and start over



    
  cv2.destroyAllWindows()

def callback(message):
    
    
    # Loop until the node is killed with Ctrl-C

    # pub_string = "hello world %s"%rospy.get_time() # define here f(message), or a function on a message
    #floorToPixel = uv_out
    #pixelToFloor = xy
    #objectToPixel = uv_out2
    #pixelToObject = xy2
    
    size = GRID_SIZE
    intervalSize = 0.3048/3
    homographies_out = homographies(floorX,floorY,objectX,objectY,size,intervalSize)
    
    #publish on many publishers related to this topic on arrival (if necessary)
    pub.publish(homographies_out)
    "otherpub.publish(message)"

    #assign globalvariables, we almost always need this
    #globalVar = function(message)
    global uv_out
    global uv_out2
    global xy
    global xy2
    "put more globalvar assignments here"

