import numpy as np

def avoid_obstacles(matrix, pos, explore):
	adjlst = []
		for i in [-1,0,1]:
			for j in [-1,0,1]:
				posi = loc+i
				posj = loc+j
				if posi > 0 and posj > 0:
					if posi < matrix.shape[0] and posj < matrix.shape[1]:
						adjlst.append((posi,posj))
	cost = 0
	for pos in adjlst:
		if matrix[pos] == 1:
			cost += 2

	return cost
def value_update(goal, start, matrix, fn, gamma = .9):
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
				posi = loc+i
				posj = loc+j
				if posi > 0 and posj > 0:
					if posi < matrix.shape[0] and posj < matrix.shape[1]:
						adjlst.append((posi,posj))
		return adjlst

	costs = -1*np.ones(matrix.shape)
	frontier = {goal}
	nextfrontier = set()
	seen = set()
	costs[goal] = 0
	while len(frontier) != 0:
		explore = frontier.pop()
		seen.union(set(frontier))
		adj = adjacent(matrix, explore)
		for loc in adj:
			if costs[loc] != -1:
				costs[loc] = min(costs[loc], costs[explore] + fn(matrix, loc, explore) + 1)
			else:
				matrix[loc] = costs[explore] + fn(matrix, loc, explore) + 1
		nextfrontier.union(set(adj).difference(seen))
		if len(frontier) == 0:
			frontier = newfrontier
			newfrontier = set()
	return costs

matrix = np.zeros((12,12))
print value_update((0,0), (3,10), matrix, avoid_obstacles)