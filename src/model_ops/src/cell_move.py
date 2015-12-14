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
from collections import deque


# listener = None
rw_cur = None
length = None
rw_des = None
turn = False
zumy = None
done = False
target = None

ang_buff = deque([], 3)

def callback_state(msg):
    # global rw_des
    global rw_cur, length, zumy
    # print msg
    rw_cur = msg
    # print rw_cur
    if length is not None:
        # print "rw_cur: "+ str((msg.translation.x, msg.translation.y))
        zumy = (int(round((msg.translation.x - length/2.0)/length)), 
            int(round((msg.translation.y - length/2.0)/length)))

def callback_homo(msg):
    global length
    length = msg.intervalSize

def update_model(msg):
    global target

    # print msg.foundX, msg.foundY
    if msg.foundX != -1:
        target = (msg.foundX-.03, msg.foundY)

def callback_goal(msg):
    global rw_des, goal, turn, done
    if msg.sx == -2 and msg.sy == -2:
        # print msg.sx, msg.sy
        turn = True
    elif msg.sx == -3 and msg.sy == -3:
        done = True
    else:
        turn = False
        done = False
    gx = msg.gx
    gy = msg.gy
    # print msg

    trans = np.array([length*gx + length/2.0, length*gy + length/2.0, 0])
    rot = np.array([0,0,0,1])
    # print "dest: "+ str(trans)
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
    subs_homo = rospy.Subscriber('/homography_out', homographies, callback_homo)
    subs_state = rospy.Subscriber('/'+zumyname+'/state_estimate', Transform, callback_state)
    subs_goal = rospy.Subscriber('/'+zumyname+'/next_cell', startGoal, callback_goal)
    rospy.Subscriber('/'+ zumyname + "/model", model, update_model)
    pub = rospy.Publisher('/'+zumyname+'/cmd_vel', Twist, queue_size=10)
    pub_state = rospy.Publisher('/'+zumyname+'/reached', doneWith, queue_size=10)
    rate = rospy.Rate(5.0)
    global ang_prev
    ang_prev = 0
    # wait = rospy.Rate(2.0)
    stopped_counter = 0

    turncount = 0
    forward_mode = False

    while not rospy.is_shutdown():
        # pub = rospy.Publisher('/twists_wanted', Twist, queue_size=10)
        try:
            # print ar_tags['ar0'], ar_tags['ar1']
            # twist = None
            # trans = np.array([[1],[0],[0]])
            # tnew = np.array([[0],[1],[0]])
            # rot = np.array([[0],[0],[0],[1]])
            # rw_cur = Transform(Vector3(trans[0], trans[1], trans[2]),Quaternion(rot[0], rot[1], rot[2], rot[3]))
            # print rw_cur, rw_des
            # rw_des = Transform(Vector3(tnew[0], tnew[1], tnew[2]),Quaternion(rot[0], rot[1], rot[2], rot[3]))
            # rw_cur = np.array([[1,0,0,0],[0,1,0,1],[0,0,1,0],[0,0,0,1]])
            # rw_des = np.array([[1,0,0,1],[0,1,0,0],[0,0,1,0],[0,0,0,1]])
            if target is not None:
                print "target: " +str(target)
                trans = np.array([target[0],target[1],0])
                rot = np.array([0,0,0,1])
                # print "dest: "+ str(trans)
                rw_des = Transform(Vector3(trans[0], trans[1], trans[2]), Quaternion(rot[0], rot[1], rot[2], rot[3]))
                # print "rw_des" + str(rw_des)
            # o1, t1 = eqf.quaternion_to_exp(np.array([0, 0, 1, rw_cur.rotation.w]))
            o1, t1 = eqf.quaternion_to_exp(np.array([rw_cur.rotation.x, rw_cur.rotation.y, rw_cur.rotation.z, rw_cur.rotation.w]))
            oi, ti = o1, t1
            o2, t2 = eqf.quaternion_to_exp(np.array([rw_des.rotation.x, rw_des.rotation.y, rw_des.rotation.z, rw_des.rotation.w]))

            # print 'cur' + str([rw_cur.rotation.x, rw_cur.rotation.y, rw_cur.rotation.z, rw_cur.rotation.w])
            # print 'des' + str([rw_des.rotation.x, rw_des.rotation.y, rw_des.rotation.z, rw_des.rotation.w])
            # print 'o2' + str(o2)
            # print 'cur: ' + str(o1) + " " + str(t1)
            rb_i = eqf.create_rbt(oi, ti, np.array([rw_cur.translation.x, rw_cur.translation.y, .15]))
            rb_cur = eqf.create_rbt(o1, t1, np.array([rw_cur.translation.x, rw_cur.translation.y, .15]))
            rb_des = eqf.create_rbt(o2, t2, np.array([rw_des.translation.x, rw_des.translation.y, .15]))
            # print 'rb_cur'+str(rb_cur)
            # print 'rb_des'+str(rb_des)
            # homogeneous = eqf.compute_gab(rb_cur, rb_des)
            # trans = homogeneous[:2,3]
            homogeneous = rb_cur[:2,:2].T
            print 'homo'+str(homogeneous)
            print 'homofull' + str(rb_cur)
            # print o1,t1
            # homogeneous = homogeneous
            # print rw_cur.translation.x, rw_cur.translation.y, rw_cur.translation.z
            # print rw_des.translation.x, rw_des.translation.y, rw_cur.translation.z
            print rw_cur
            # print rw_des 
            print (rw_cur.translation.x, rw_cur.translation.y)
            vecto = np.asarray((rw_des.translation.x, rw_des.translation.y)).reshape(2,1) - np.asarray((rw_cur.translation.x, rw_cur.translation.y)).reshape(2,1)
            print vecto
            trans = np.dot(homogeneous, vecto)
            # print trans
            print 'trans'+str(trans)
            print 'dest ' + str(rb_des[:2,3])
            # (omega,theta) = eqf.find_omega_theta(homogeneous[0:2,0:2])
            # try:
            #     (trans, rot) = listener.lookupTransform(rw_des, rw_cur, rospy.Time(0))
            # except:
            #     print "not enough"
            #     continue
            twist = [[0,0,0], [0,0,0]]
            if (abs(rb_i[0,0] - rb_i[1,1]) < .1) and abs(rb_i[0,1] - -1*rb_i[1,0]) < .1:
                unfound = True
                # print unfound
                # print "transl: " + str((int(rw_des.translation.x/length), int(rw_des.translation.y/length)))
                # print 'trans: '+str(rw_cur)+" "+str(trans) + str(trans[0]**2+ trans[1]**2) + str(zumy)
                # ang = np.arctan2(trans[1], trans[0])
                ang = np.arctan(trans[1]/trans[0])
                if trans[1] < 0 and trans[0] < 0:
                    ang = -np.pi + ang
                elif trans[1] > 0 and trans[0] < 0:
                    ang = np.pi + ang

                # print 'ang angnew ' + str(ang) + str(np.arctan(trans[1]/trans[0]))
                ang_buff.append(ang)
                ang = np.median(np.asarray(list(ang_buff)))
                print "angle: " + str(ang) + " x: " + str(trans[0]) +  "y: " + str(trans[1])
                # print homogeneous, rb_cur, rb_des
                if trans[0]**2+ trans[1]**2 < .0006 or done:
                    print done
                    pub.publish(Twist(Vector3(0,0,0), Vector3(0,0,0)))
                    # print 'twist'+str(twist[0][0]**2+ twist[0][1]**2+ twist[0][2]**2)
                    pub_state.publish(doneWith(True, round((rw_des.translation.x - length/2)/length), round((rw_des.translation.y - length/2)/length)))
                    unfound = False
                    forward_mode = False
                    print doneWith(True, round((rw_des.translation.x - length/2)/length), round((rw_des.translation.y - length/2)/length))
                    # print 'hella small'
                    # print unfound
                    # print unfound

                else:
                    if abs(ang) < .01 or forward_mode:
                        # forward_mode = True
                        if turn:
                            pub_state.publish(doneWith(True, -2, -2))
                        else:
                            if trans[0] < 0:
                                twist[0] = [-1*trans[0]*.6,0,0]
                            # print 'go go power rangers'
                            else:
                                twist[0] = [trans[0]*.6,0,0]
                    else:
                        if abs(ang) > .5:
                            twist[1] = [0,0,ang*.4]
                        else:
                            twist[1] = [0,0,np.sign(ang)*.1]
                    if abs(ang) > .4:
                        forward_mode = False

                # elif abs(ang) > np.pi/2.0:

                #     # if abs(ang_prev-ang)>0.5 and ang_prev*ang == -1:
                #     #     ang = ang_prev
                #     #     twist[1] = [0,0,0]
                #     # print 'x translation is negative'
                #     if abs(ang)-np.pi/2 > .5:
                #         # print 'trans1'
                #         # print trans[1]
                #         if ang < 0:
                #             # print 'y translation is negative, so spin cw'
                #             twist[1] = [0,0,-.21]
                #         else:
                #             # print 'y translation is positive, so spin ccw'
                #             twist[1] = [0,0,.21]

                #     if turn:
                #         twist[1] = [0,0,.3]
                #     else:
                #         print "reverse"
                #         twist[0] = [-.1,0,0]
                #         # twist[0] = [.1,0,0]
                #     # print unfound        
                # else:
                #     # if abs(ang_prev-ang)>0.6:
                #     #     ang = ang_prev
                #     #     twist[1] = [0,0,0]
                #     if abs(ang) > .05:
                #         if ang < 0:
                #             # print 'x translation '
                #             twist[1] = [0,0,.21]
                #         else:
                #             twist[1] = [0,0,-.21]
                #     else:
                #         if turn:
                #             pub_state.publish(doneWith(True, -2, -2))
                #         else:
                #             # print 'go go power rangers'
                #             twist[0] = [.15,0,0]
                #             # wait.sleep()

                    # print unfound

                # omega, theta = eqf.quaternion_to_exp(rot)
                # print 'twist'+str(twist)
                ang_prev = ang

                if unfound:
                    print twist
                    pub.publish(Twist(Vector3(twist[0][0]*1,twist[0][1],twist[0][2]),
                                     Vector3(twist[1][0],twist[1][1],twist[1][2])))
            else:
                print "bad rotation matrix"
                pub.publish(Twist(Vector3(twist[0][0]*1,twist[0][1],twist[0][2]),
                                     Vector3(twist[1][0],twist[1][1],twist[1][2])))

            # if rw_cur[:,3]==rw_des[:,3]:
            # 	pub.publish(1)
        except Exception as e:
            print "Insufficient information " + str(e)
        rate.sleep()