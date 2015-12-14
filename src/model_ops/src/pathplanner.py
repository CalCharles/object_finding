import numpy as np
import value as val


def plan_path(costs, start, end):
	pathlist = []
	loc = start
	oldloc = start
	while loc != end:
		adjlst = val.adjacent(costs, loc)
		minadjv = costs[loc]
		for adj in adjlst:
			if minadjv > costs[adj]:
				minadjv = costs[adj]
				loc = adj
		# print loc
		if loc == oldloc:
			break
		pathlist.append(loc)
	return pathlist

def gen_path(start, end, matrix, fn=val.avoid_obstacles):
	costs = val.value_update(start, end, matrix, fn)
	return plan_path(costs, start, end)



matrix = np.zeros((12,12))
matrix[(0,8)] = 1
matrix[(0,9)] = 1
# matrix[(3,2)] = 1
# matrix[(3,3)] = 1
# matrix[(3,1)] = 1
# matrix[(3,0)] = 1
# matrix[(3,4)] = 1
# matrix[(1,3)] = 1
# matrix[(0,3)] = 1

costs = val.value_update((1,5), (1,11), matrix, val.avoid_obstacles)
print costs
print plan_path(costs,  (1,5), (1,11))