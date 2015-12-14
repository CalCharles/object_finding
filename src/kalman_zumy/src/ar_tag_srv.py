#!/usr/bin/env python

import sys
import tf
from tf2_msgs.msg import TFMessage
import rospy
from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
import exp_quat_func as eqf

listener = None

def callback(msg, tags):
	ar_tag_z, ar_tag = tags
	trans, rot = listener.lookupTransform(ar_tag_z, ar_tag, rospy.Time(0))
	transform = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
	innovate = rospy.ServiceProxy('innovation', NuSrv)
	innovate(transform, ar_tag)

if __name__ == '__main__':
	ar_tag_z = 'ar_marker_' + sys.argv[1]
	ar_tag = 'ar_marker_' + sys.argv[2]

	rospy.init_node('ar_tag_srv')
	listener = tf.TransformListener()
	rospy.Subscriber('/tf', TFMessage, callback, (ar_tag_z, ar_tag))
	rospy.spin()