#!/usr/bin/env python

import sys
import tf
from tf2_msgs.msg import TFMessage
import rospy
from kalman_zumy.srv import NuSrv, NuSrvResponse
from geometry_msgs.msg import Transform, Quaternion, Vector3
from image_to_grid.msg import toTarget
from collections import deque
import numpy as np
# import exp_quat_func as eqf

listener = None
state_est = True
last_known = None
found_tag = None
last_known_at_found = None
real_rot_backup = None
counter = 10

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
        	print found_tag
        r.sleep()
    rospy.signal_shutdown("should be dead")

def callback(msg, tags):
	global last_known, last_known_at_found, counter, buffps
	global found_tag
	global real_rot_backup

	ar_tag_z, ar_tag_o, ar_tag_t = tags
	trans, rot = listener.lookupTransform(ar_tag_z, ar_tag_o, rospy.Time(0))
	# print rot
	buff.append(np.asarray(rot))
	buffps.append(np.asarray(trans))
	# print buff
	# print buff[0]
	# real_rot = np.zeros((4,),float)
	# real_rot = np.append([real_rot],[buff[0]],axis=0)
	# # print real_rot
	# for i in range(1,len(buff)):
	# 	# real_rot[0] = float(real_rot[0]) + float(buff[i][0])
	# 	# real_rot[1] = float(real_rot[1]) + float(buff[i][1])
	# 	# real_rot[2] = float(real_rot[2]) + float(buff[i][2])
	# 	# real_rot[3] = float(real_rot[3]) + float(buff[i][3])
	# 	# real_rot = np.vstack(([real_rot],[buff[i]]))
	# 	real_rot = np.append(real_rot,[buff[i]],axis=0)
	# real_rot_avg = real_rot/len(buff)
	# print real_rot
	# print real_rot.shape
	real_rot_avg = np.median(np.asarray((list(buff))), axis = 0).tolist()
	pos_avg = np.median(np.asarray(list(buffps)), axis=0).tolist()
	real_rot_round = real_rot_avg 
	# real_rot_round = np.empty((4,),float)
	# print real_rot_avg
	# real_rot_round[0] = round(real_rot_avg[0],6)
	# real_rot_round[1] = round(real_rot_avg[1],6)
	# real_rot_round[2] = round(real_rot_avg[2],6)
	# real_rot_round[3] = round(real_rot_avg[3],6)
	# # print real_rot_backup
	# if (real_rot_backup is None or counter < 10) and np.linalg.norm(real_rot_round) < 2:
	# 	real_rot_backup = real_rot_round
	# 	counter += 1
	# if abs(real_rot_round[0]-real_rot_backup[0])>1 or abs(real_rot_round[1]-real_rot_backup[1])>1 or abs(real_rot_round[2]-real_rot_backup[2])>1 or abs(real_rot_round[3]-real_rot_backup[3])>1:
	# 	real_rot_round = real_rot_backup+0.05
	# print real_rot_avg
	# print real_rot_round
	try:
		ft, fr = listener.lookupTransform(zumy_name + '.usb_cam', ar_tag_t, rospy.Time(0))
		found_tag = Transform(Vector3(ft[0], ft[1], ft[2]), Quaternion(fr[0], fr[1], fr[2], fr[3]))
		last_known_at_found = Transform(Vector3(pos_avg[0], pos_avg[1], pos_avg[2]), Quaternion(real_rot_round[0], real_rot_round[1], real_rot_round[2], real_rot_round[3]))
		# last_known_at_found = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
		print last_known_at_found
	except Exception as e:
		pass
	# real_rot_backup = real_rot_round
	# transform = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
	# print real_rot_round[0]
	transform = Transform(Vector3(pos_avg[0], pos_avg[1], pos_avg[2]), Quaternion(real_rot_round[0], real_rot_round[1], real_rot_round[2], real_rot_round[3]))
	last_known = transform

	# print last_known

if __name__ == '__main__':
	ar_tag_z = 'ar_marker_' + sys.argv[2] # zumy
	ar_tag_o = 'ar_marker_' + sys.argv[1] # origin
	ar_tag_t = 'ar_marker_' + sys.argv[3] # target
	state_estimate = sys.argv[4] 
	zumy_name = sys.argv[5] 
	global state_est
	global buff, buffps
	buff = deque([],5)
	buffps = deque([],5)
	if state_estimate == 'true':
		state_est = True
	else:
		state_est = False

	rospy.init_node('ar_tag_srv')
	listener = tf.TransformListener()
	rospy.Subscriber('/tf', TFMessage, callback, (ar_tag_z, ar_tag_o, ar_tag_t))
	responder(zumy_name)
	rospy.spin()
