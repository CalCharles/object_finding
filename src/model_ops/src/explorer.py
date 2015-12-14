#!/usr/bin/env python


# # -*- coding: utf-8 -*-
# """
# Created on Tue Dec 01 16:19:23 2015

# @author: gc
# """

# take all of the points blocked by the box, take all the points blocked by other boxes.
# need access to grid
# state should be an array of strings, either 'visited' or empty
import numpy as np
import exp_quat_func as eqf
import rospy
import sys
# import tf
# import ar_tag_subs as ats
from std_msgs.msg import Bool
from model_ops.msg import model, startGoalCentroid, doneWith
from image_to_grid.msg import pixelxy
import matplotlib.pyplot as plt
import value as val
# currentPos needs to also include orientation of zumy

toVisit = None

zumy_pos = None
target = None
new_op = False
objects = None
grid = None

skip = 0

reached = None
desti = None

pub_nav = None

def grid_check(point, grid):
    return point[0] >= 0 and point[1] >= 0 and point[0] < 12 and point[1] < 12 and grid[point] == 0

def explorer(objs_des):
    # print 'objs_des'+str(objs_des)
    currentPos = zumy_pos 
    # print objs_des
    # print np.sum(objs_des, axis=0)
    com_x = np.floor(np.sum(objs_des, axis=0)[0]/len(objs_des))
    com_y = np.floor(np.sum(objs_des, axis=0)[1]/len(objs_des))        
    distance = -1
    for i in range(len(objs_des)):
        if np.linalg.norm(objs_des[i]-[com_x,com_y])>distance:
            distance = np.linalg.norm(objs_des[i]-[com_x,com_y])
    radius = distance + 2
    omega = np.array([[0],[0],[1]])
    theta = -np.pi/4 #assuming exploration in cw direction
    n= 8 #number of sides
    # om, th = eqf.find_omega_theta(zumyRBT[0:3,0:3])
    length = 2*radius*np.sin(np.pi/n)
    # print 'octagon'+str(com_x)+str(com_y)+str(radius)+str(length)
    # translation = np.array([[currentPos[0]+length*np.cos(th)],[currentPos[1]+length*np.sin(th)],[0]])
    # since translations are relative to spatial frame, right?    
    #translation = np.hstack((currentPos-corner[idx],[0])).T
    octagon_points = np.empty((8,2),float)
    octagon_points[0,0] = com_x+length/2
    octagon_points[0,1] = com_y-radius
    octagon_points[1,0] = com_x-length/2
    octagon_points[1,1] = com_y-radius
    octagon_points[2,0] = com_x-radius
    octagon_points[2,1] = com_y-length/2
    octagon_points[3,0] = com_x-radius
    octagon_points[3,1] = com_y+length/2
    octagon_points[4,0] = com_x-length/2
    octagon_points[4,1] = com_y+radius
    octagon_points[5,0] = com_x+length/2
    octagon_points[5,1] = com_y+radius
    octagon_points[6,0] = com_x+radius
    octagon_points[6,1] = com_y+length/2
    octagon_points[7,0] = com_x+radius
    octagon_points[7,1] = com_y-length/2
    oops = False
    print 'old' + str(octagon_points)
    new_pts = []
    for i in range(octagon_points.shape[0]):
        point = (octagon_points[i][0], octagon_points[i][1])
        if not grid_check(point, grid):
            for adj_pnt in val.adjacent(grid, point):
                if grid_check(adj_pnt, grid):
                    new_pts.append([adj_pnt[0], adj_pnt[1]])
                    break

            # dist = 100
            # for j in range(3):
            #     for m in range(3):

            #         if np.linalg.norm([octagon_points[i][0]-j,octagon_points[i][1]-m]) < dist:
            #             for k in range(len(objects[0])):
            #                 print 'ugh' + str(int(octagon_points[i][0]-j))
            #                 if int(octagon_points[i][0]-j) == objects[0][k][0] and int(octagon_points[i][1]-m) == objects[0][k][1]:
            #                     print 'okay cool'
            #                     print int(octagon_points[i][0]-j)
            #                     oops = True
            #                     break
            #                 if oops == False:
            #                     # print 'huh'
            #                     dist = np.linalg.norm([octagon_points[i][0]-j,octagon_points[i][1]-m])
            #                     # print 'dist' + str(dist)
            #                     new_lst = [octagon_points[i][0]-j,octagon_points[i][1]-m]
            #                     # print 'new' + str(new)
            # if dist != 100 and oops == False:
            #     octagon_points[i] = np.array(new_lst)
            # else:
            #     print 'gotta delete'
            #     toDelete.append(i)
        else:
            new_pts.append([point[0], point[1]])
    def edist(p1, p2):
        return np.linalg.norm((p1[0]-p2[0], p1[1]-p2[1]))
    dist = 10000
    best = 0
    for i in range(len(new_pts)):
        ndist = edist(zumy_pos, new_pts[i])
        if ndist < dist:
            best = i
            dist = ndist
    new_pts = new_pts[best:] + new_pts[:best]
    if edist(new_pts[0], new_pts[-1]) < edist(new_pts[0], new_pts[1]):
        new_pts = [new_pts[0]] + new_pts[1:][::-1]
    # print toDelete
    # for i in toDelete:
    #     octagon_points_new = np.delete(octagon_points,i,0)
    # print 'before'+str(octagon_points_new)

    print new_pts
    points = np.asarray([zumy_pos] + new_pts).astype(int)
    print 'octagon'+str(points)
    # pub_nav.publish(startGoal(zumy_pos, octagon_points[0]))
    # print zumy_pos
    return points, (com_x, com_y)


    
# def checkPos():
#     for i in range(len(toVisit)):  
#         if currentPos != toVisit[i,:]:
#             off_path = 50000
#             idx = -1
#             for j in range(len(toVisit)):
#                 if np.linalg.norm(currentPos-toVisit[j,:])<=off_path:
#                     off_path = np.linalg.norm(currentPos-toVisit[j,:])
#                     idx = j
#     omega = np.array([[0],[0],[1]])
#     theta = np.arctan2(toVisit[idx][0]-currentPos[0],toVisit[idx][1]-currentPos[1])
#     rbtToNextBlock = eqf.create_rbt(omega,theta,toVisit[idx]-currentPos)
#     twist_fix = ats.compute_twist(rbtToNextBlock)


def callback_state(msg):
    # if state[currentPos] == '':
    #     grid[currentPos].state = 'visited'
    global reached
    global desti
    desti = (msg.withX, msg.withY)
    reached = msg.done
        
def callback_model(msg):
    # global rw_des
    global grid
    global zumy_pos
    global objects
    

    zumy_pos = (msg.zumyX, msg.zumyY)
    if msg.dirty or grid is None:
        # print "generating"
        grid = np.asarray(msg.grid).reshape(msg.length, msg.width).astype(bool)
        objects = []
        idx = 0
        # print np.hstack((np.array(msg.objLstx), np.array(msg.objLsty)))
        leng = len(msg.objLstx)
        for i in range(len(msg.objLstx)):
            if msg.objLstx[i]==-1:
                objects.append(np.hstack((np.asarray(msg.objLstx[idx:i]).reshape(i-idx,1), 
                    np.asarray(msg.objLsty[idx:i]).reshape(i-idx,1))))
                idx = i+1

def callback_target(msg):
    global new_op
    global target
    global explore
    ntarget = (msg.x, msg.y)
    # print msg, target
    if target is None or (ntarget[0] != target[0] and ntarget[1] != target[1]):
        new_op = True
        explore -= 1

    # else:
    #     new_op = False
    target = ntarget

  
        
if __name__=='__main__':
    rospy.init_node('explorer')

    zumyname = sys.argv[1]
    explore = int(sys.argv[2])

    # listener = tf.TransformListener()
    rospy.Subscriber('/'+zumyname+'/nav_complete', doneWith, callback_state)
    rospy.Subscriber('/'+zumyname+'/model', model, callback_model)
    rospy.Subscriber('/'+zumyname+'/object_to_find', pixelxy, callback_target)
    pub_nav = rospy.Publisher('/'+zumyname+'/nav_to', startGoalCentroid, queue_size=10)
    pub_fin = rospy.Publisher('/'+zumyname+'/exp_complete', doneWith, queue_size=10)

    rate = rospy.Rate(10.0)
    points = []
    obj = 0
    idx = 0
    done = False
    cent = None
    # published = False

    while not rospy.is_shutdown():
        twist = None
        try:
            if target is not None and new_op:
                # print new_op
                idx = 0
                # print 'objects from explorer to explore'
                print objects
                for i in range(len(objects)):
                    objc = objects[i]
                    # print target
                    # print objc[0]
                    if objc[0][0] == target[0] and objc[0][1] == target[1]:
                        obj = i
                # print obj
                # print objects[i]
                points, cent = explorer(objects[obj])
                # print 'points' + str(points)
                new_op = False
                # published = True
            else:
                # print points
                # print idx
                # print objects[obj]
                if idx < len(points):
                    print "reached: " +str(reached) + " desti: " + str(desti) + "points: " + str(points[idx])
                    gzum = grid.astype(float)
                    for pnt in points[idx:]:
                        # print pnt
                        gzum[(pnt[0], pnt[1])] = .75
                    # print gzum
                    gzum[zumy_pos] = .5
                    plt.imshow(gzum, interpolation='nearest')
                    plt.pause(.001)
                    plt.show(block=False)
                    if reached and points[idx, 0] == desti[0] and points[idx, 1] == desti[1]:
                        # print desti
                        idx += 1
                        reached = False
                        if idx < len(points):
                            # print 'we reached this shit'
                            pub_nav.publish(startGoalCentroid(zumy_pos[0],zumy_pos[1], points[idx,0], points[idx,1], cent[0], cent[1]))
                    else:
                        pub_nav.publish(startGoalCentroid(zumy_pos[0],zumy_pos[1], points[idx,0], points[idx,1], cent[0], cent[1]))
                elif explore > 0:
                    # print done
                    print "explore done: " + str(target)
                    done = True
                    # print 'we did not reach this shit'
                    pub_fin.publish(doneWith(True, target[0], target[1]))
                else:
                    # print done
                    print "explore done: " + str(target)
                    done = True
                    # print 'we did not reach this shit'
                    pub_fin.publish(doneWith(True))

            # stateUpdate()
        except Exception as e:
            print 'insufficient data: ' + str(e)

            
        rate.sleep()
    rospy.signal_shutdown("should be dead")
