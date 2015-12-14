#!/usr/bin/env python

import sys
import tf
from tf2_msgs.msg import TFMessage
import rospy
from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
from image_to_grid.msg import toTarget
# import exp_quat_func as eqf

listener = None
state_est = True
last_known = None
found_tag = None
last_known_at_found = None

#Define the method which contains the node's main functionality
def responder(zumy_name):
    # initalize the publishers 

    pub = rospy.Publisher('/' + zumy_name + '/state_estimate', Transform, queue_size=10)
    pub_found = rospy.Publisher('/' + zumy_name + '/target_transform', toTarget, queue_size=10)
    r = rospy.Rate(10) # 10hz
    while not rospy.is_shutdown():
        #publish on all of my publishing topics
        # pub.publish(griZumy(   ))
        # print found_tag
        if last_known is not None and state_est:
            pub.publish(last_known)
        if found_tag is not None:
        	pub_found.publish(toTarget(last_known_at_found, found_tag))
        r.sleep()
    rospy.signal_shutdown("should be dead")

def callback(msg, tags):
	global last_known, last_known_at_found
	global found_tag

	ar_tag_z, ar_tag_o, ar_tag_t = tags
	trans, rot = listener.lookupTransform(ar_tag_z, ar_tag_o, rospy.Time(0))
	try:
		ft, fr = listener.lookupTransform(zumy_name + '.usb_cam', ar_tag_t, rospy.Time(0))
		found_tag = Transform(Vector3(ft[0], ft[1], ft[2]), Quaternion(fr[0], fr[1], fr[2], fr[3]))
		last_known_at_found = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
		print last_known_at_found
	except tf.LookupException as e:
		pass
	transform = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
	last_known = transform
	# print last_known

if __name__ == '__main__':
	ar_tag_z = 'ar_marker_' + sys.argv[2] # zumy
	ar_tag_o = 'ar_marker_' + sys.argv[1] # origin
	ar_tag_t = 'ar_marker_' + sys.argv[3] # target
	state_estimate = sys.argv[4] 
	zumy_name = sys.argv[5] 
	global state_est
	if state_estimate == 'true':
		state_est = True
	else:
		state_est = False

	rospy.init_node('ar_tag_srv')
	listener = tf.TransformListener()
	rospy.Subscriber('/tf', TFMessage, callback, (ar_tag_z, ar_tag_o, ar_tag_t))
	responder(zumy_name)
	rospy.spin()