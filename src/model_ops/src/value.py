import numpy as np

def avoid_obstacles(matrix, pos, explore):
	adjlst = []
	for i in [-1,0,1]:
		for j in [-1,0,1]:
			posi = pos[0]+i
			posj = pos[1]+j
			if posi >= 0 and posj >= 0:
				if posi < matrix.shape[0] and posj < matrix.shape[1]:
					adjlst.append((posi,posj))
	cost = 0
	# print adjlst, pos
	if matrix[pos] == 1:
		cost += 100
	for loc in adjlst:
		if matrix[loc] == 1:
			cost += 2

	return cost

def distance_nearest_obstacle(matrix, pos, explore):
	pass

def adjacent(matrix, loc):
		# adjlst = []
		# for i in [-1,0,1]:
		# 	for j in [-1,1]:
		# 		if i == 0:
		# 			posi = loc
		# 			posj = loc+j
		# 		else:
		# 			posi = loc+i
		# 			posj = loc
		# 		if posi > 0 and posj > 0:
		# 			if posi < matrix.shape[0] and posj < matrix.shape[1]:
		# 				adjlst.append((posi,posj))
		adjlst = []
		for i in [-1,0,1]:
			for j in [-1,0,1]:
				posi = loc[0]+i
				posj = loc[1]+j
				# print posi, posj
				if posi >= 0 and posj >= 0:
					if posi < matrix.shape[0] and posj < matrix.shape[1]:
						adjlst.append((posi,posj))
		return adjlst

def value_update(start, goal, matrix, fn, gamma = .9):
	''' The goal is an x,y coordinate, the start is an x,y coordinate, the matrix is a
		nxm matrix (12x12 for this problem), where 0 denotes empty, and 1 denotes on object.
		The fn gives the cost of a location based on objects
	'''
	def adjacent(matrix, loc):
		# adjlst = []
		# for i in [-1,0,1]:
		# 	for j in [-1,1]:
		# 		if i == 0:
		# 			posi = loc
		# 			posj = loc+j
		# 		else:
		# 			posi = loc+i
		# 			posj = loc
		# 		if posi > 0 and posj > 0:
		# 			if posi < matrix.shape[0] and posj < matrix.shape[1]:
		# 				adjlst.append((posi,posj))
		adjlst = []
		for i in [-1,0,1]:
			for j in [-1,0,1]:
				posi = loc[0]+i
				posj = loc[1]+j
				# print posi, posj
				if posi >= 0 and posj >= 0:
					if posi < matrix.shape[0] and posj < matrix.shape[1]:
						adjlst.append((posi,posj))
		return adjlst

	costs = -1*np.ones(matrix.shape)
	frontier = {goal}
	newfrontier = set()
	seen = set()
	costs[goal] = 0
	def dist(loc1, loc2):
		return np.linalg.norm((loc1[0]-loc2[0], loc1[1]-loc2[1]))
	while len(frontier) != 0:
		explore = frontier.pop()
		# print explore
		seen = seen.union(set([explore]))
		adj = adjacent(matrix, explore)
		safe = []
		for loc in adj:
			if costs[loc] != -1:
				# print loc
				costs[loc] = min(costs[loc], costs[explore] + fn(matrix, loc, explore) + dist(loc, explore))
			else:
				# print loc
				# print costs[explore] + fn(matrix, loc, explore) + 1
				costs[loc] = costs[explore] + fn(matrix, loc, explore) + dist(loc, explore)
			if matrix[loc] == 0:
				safe.append(loc)
		newfrontier = newfrontier.union(set(safe).difference(seen))
		if len(frontier) == 0:
			frontier = newfrontier
			newfrontier = set()
		# print costs
		# error
			# print seen
	return costs

# matrix = np.zeros((12,12))
# matrix[(2,2)] = 1
# matrix[(2,3)] = 1
# matrix[(3,2)] = 1
# matrix[(3,3)] = 1
# matrix[(3,1)] = 1
# # matrix[(3,0)] = 1
# matrix[(3,4)] = 1
# matrix[(1,3)] = 1
# matrix[(0,3)] = 1
# print value_update((0,0), (3,10), matrix, avoid_obstacles)

