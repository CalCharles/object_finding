#!/usr/bin/env python
import tf
import rospy
import sys
import math
import numpy as np
from tf2_msgs.msg import TFMessage
from geometry_msgs.msg import Transform, Vector3, Twist
# import kin_func_skeleton as kfs
import exp_quat_func as eqf

listener = None

def callback_state(msg):
    # global rw_des
    global rw_cur
    rw_cur = msg

def callback_homo(msg):
    global length
    length = msg.intervalSize

def callback_goal(msg):
    global rw_des

    gx = msg.gx
    gy = msg.gy

    rw_des_trans = np.array([[length*gx],[length*gy],[0]])
    rw_des_rot = np.array([[0],[0],[1]])

if __name__=='__main__':
    rospy.init_node('turn_straight')
    if len(sys.argv) < 1:
        print('Use: ar_tag_subs.py [zumyname] ')
        sys.exit()
    # ar_tags = {}
    zumyname = sys.argv[1]
    # ar_tags['ar1'] = 'ar_marker_' + sys.argv[2]

    # /zumyname/state_estimate
    listener = tf.TransformListener()
    subs_homo = rospy.Subscriber('/homography_out', float32, callback_homo)
    subs_state = rospy.Subscriber('/'+zumyname+'/state_estimate', Transform, callback_state)
    subs_goal = rospy.Subscriber('/'+zumyname+'/next_cell', startgoal, callback_goal)
    rate = rospy.Rate(5.0)
    wait = rospy.Rate(10.0)
    while not rospy.is_shutdown():
        pub = rospy.Publisher('/twists_wanted', Twist, queue_size=10)
        # print ar_tags['ar0'], ar_tags['ar1']
        # twist = None
        
        try:
            (trans, rot) = listener.lookupTransform(rw_des, rw_cur, rospy.Time(0))
        except:
            print "not enough"
            continue
        twist = [[0,0,0], [0,0,0]]
        if trans[0]**2+ trans[1]**2+ trans[2]**2 < .05:
            pub.publish(Twist(Vector3(0,0,0), Vector3(0,0,0)))
            print twist[0][0]**2+ twist[0][1]**2+ twist[0][2]**2
            continue
        if abs(trans[1]) > .1:
            if trans[1] < 0:
                twist[1] = [0,0,.2]
            else:
                twist[1] = [0,0,-.2]
        else:
            twist[0] = [1,0,0]

        omega, theta = eqf.quaternion_to_exp( rot)
        print twist

        if twist != None:
            pub.publish(Twist(Vector3(twist[0][0]*1,twist[0][1],twist[0][2]),
                             Vector3(twist[1][0],twist[1][1],twist[1][2])))
        rate.sleep()