#!/usr/bin/env python


# import numpy as np
# import exp_quat_func as eqf
# import ar_tag_subs as ats

# def cell_move(currentPos_world,desiredPos_world):

# 	turn_and_straight 
# 	

#!/usr/bin/env python
import tf
from tf2_msgs.msg import TFMessage
import rospy
import sys
import math
import numpy as np
import exp_quat_func as eqf
from tf2_msgs.msg import TFMessage
from geometry_msgs.msg import Transform, Vector3, Twist, Quaternion
from model_ops.msg import model, startGoal, doneWith
from image_to_grid.msg import homographies
from std_msgs.msg import Bool
# import kin_func_skeleton as kfs
import exp_quat_func as eqf

# listener = None
rw_cur = None
length = None
rw_des = None

def callback_state(msg):
    # global rw_des
    global rw_cur
    # print msg
    rw_cur = msg

def callback_homo(msg):
    global length
    length = msg.intervalSize

def callback_goal(msg):
    global rw_des
    gx = msg.gx
    gy = msg.gy
    # print msg

    trans = np.array([length*gx,length*gy,0])
    rot = np.array([0,0,0,1])
    rw_des = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
    # print 'rw_des' + str(rw_des)

if __name__=='__main__':
    rospy.init_node('cell_move')
    if len(sys.argv) < 1:
        print('Use: cell_move.py [zumyname] ')
        sys.exit()
    # ar_tags = {}
    zumyname = sys.argv[1]
    # ar_tags['ar1'] = 'ar_marker_' + sys.argv[2]

    # /zumyname/state_estimate
    # listener = tf.TransformListener()
    # subs_homo = rospy.Subscriber('/homography_out', homographies, callback_homo)
    # subs_state = rospy.Subscriber('/'+zumyname+'/state_estimate', Transform, callback_state)
    # subs_goal = rospy.Subscriber('/'+zumyname+'/next_cell', startGoal, callback_goal)
    # pub = rospy.Publisher('/'+zumyname+'/cmd_vel', Twist, queue_size=10)
    # pub_state = rospy.Publisher('/reached', doneWith, queue_size=10)
    rate = rospy.Rate(5.0)
    wait = rospy.Rate(10.0)
    trans_cur = [0,1,0]
    rot_cur = [0,0,0,1]
    trans_des = [1,0,0]
    rot_des = [0,0,0,1]
    rw_cur = Transform(Vector3(trans_cur[0],trans_cur[1],trans_cur[2]),Quaternion(rot_cur[0], rot_cur[1], rot_cur[2], rot_cur[3]))
    rw_des = Transform(Vector3(trans_des[0],trans_des[1],trans_des[2]),Quaternion(rot_des[0], rot_des[1], rot_des[2], rot_des[3]))
    while not rospy.is_shutdown():
        # pub = rospy.Publisher('/twists_wanted', Twist, queue_size=10)
        try:
            # print ar_tags['ar0'], ar_tags['ar1']
            # twist = None
            # trans = np.array([[1],[0],[0]])
            # tnew = np.array([[0],[1],[0]])
            # rot = np.array([[0],[0],[0],[1]])
            # rw_cur = Transform(Vector3(trans[0], trans[1], trans[2]),Quaternion(rot[0], rot[1], rot[2], rot[3]))
            # print rw_cur
            # rw_des = Transform(Vector3(tnew[0], tnew[1], tnew[2]),Quaternion(rot[0], rot[1], rot[2], rot[3]))
            # rw_cur = np.array([[1,0,0,0],[0,1,0,1],[0,0,1,0],[0,0,0,1]])
            # rw_des = np.array([[1,0,0,1],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
            o1, t1 = eqf.quaternion_to_exp(np.array([rw_cur.rotation.x, rw_cur.rotation.y, rw_cur.rotation.z, rw_cur.rotation.w]))
            o2, t2 = eqf.quaternion_to_exp(np.array([rw_des.rotation.x, rw_des.rotation.y, rw_des.rotation.z, rw_des.rotation.w]))
            print 'blah' + str([rw_des.rotation.x, rw_des.rotation.y, rw_des.rotation.z, rw_des.rotation.w])
            # print 'o2' + str(o2)
            rb_cur = eqf.create_rbt(o1, t1, np.array([rw_cur.translation.x, rw_cur.translation.y, rw_cur.translation.z]))
            rb_des = eqf.create_rbt(o2, t2, np.array([rw_des.translation.x, rw_des.translation.y, rw_des.translation.z]))
            homogeneous = eqf.compute_gab(rb_cur,rb_des)
            print 'homo'+str(homogeneous)
            trans = homogeneous[0:3,3]
            # (omega,theta) = eqf.find_omega_theta(homogeneous[0:2,0:2])
            # try:
            #     (trans, rot) = listener.lookupTransform(rw_des, rw_cur, rospy.Time(0))
            # except:
            #     print "not enough"
            #     continue
            twist = [[0,0,0], [0,0,0]]
            unfound = True
            print 'trans'+str(trans)
            if trans[0]**2+ trans[1]**2+ trans[2]**2 < .01:
                pub.publish(Twist(Vector3(0,0,0), Vector3(0,0,0)))
                # print 'twist'+str(twist[0][0]**2+ twist[0][1]**2+ twist[0][2]**2)
                pub_state.publish(doneWith(True, rw_des.translation.x, rw_des.translation.y))
                unfound = False
            elif trans[0] < 0:
                if abs(trans[1]) > .3:
                    if trans[1] < 0:
                        twist[1] = [0,0,-.2]
                    else:
                        twist[1] = [0,0,.2]
            else:
                if abs(trans[0]) > .3:
                    if trans[0] < 0:
                        twist[1] = [0,0,.2]
                    else:
                        twist[1] = [0,0,-.2]
                else:
                    twist[0] = [.2,0,0]


            # omega, theta = eqf.quaternion_to_exp(rot)
            print 'twist'+str(twist)

            if unfound:
                pub.publish(Twist(Vector3(twist[0][0]*1,twist[0][1],twist[0][2]),
                                 Vector3(twist[1][0],twist[1][1],twist[1][2])))

            # if rw_cur[:,3]==rw_des[:,3]:
            # 	pub.publish(1)
        except Exception as e:
            print "Insufficient information " + str(e)
        rate.sleep()