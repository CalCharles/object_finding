import numpy as np
import value as val
import skimage.io as skio
import matplotlib.pyplot as plt
import time

image = np.asarray([[1.0 for j in range(10)] for i in range(10)])
print image

image[0,0] = 0.0
image[0,5] = 0.0
image[2,0] = 0.0
image[1,1] = 0.0
image[0,1] = 0.0

# grid = grid*.5
# grid[zumy] = 1.0
# for oc in points:
# 	grid[oc] = .25


for i in range(100):
	image[9,9] = .01 * i
	plt.imshow(image, interpolation='nearest')
	plt.pause(.0001)
	plt.show(block=False)
	# time.sleep(.1)