import skimage as sk
import skimage.io as skio
import skimage.transform as skt
import numpy as np
from skimage.filters import gaussian_filter, canny

ST_DEV = 2

def load_image(img_name):
	im = skio.imread(img_name)
	im = sk.img_as_float(im)
	return im

def thresholder(img_float):
	thresh = np.ndarray(shape=(img_float.shape[0], img_float.shape[1]))
	for i in range(img_float.shape[0]):
		for j in range(img_float.shape[1]):
			if img_float[i,j] < .5:
				thresh[i,j] = 0
			else:
				thresh[i,j] = 1
	return thresh

def greyout(img_float):
	g_img = np.ndarray(shape=(img_float.shape[0], img_float.shape[1]))
	for i in range(img_float.shape[0]):
		for j in range(img_float.shape[1]):
			g_img[i,j] = img_float[i,j][0]/(sum(img_float[i,j]))
	return g_img

def contig_regions(volume):
	pass

def polygonize(bitimg):
	pass



def run_process(img_name, cf):
	if type(img_name) is str:
		img = load_image(img_name)
	else:
		img = img_name
	height = img.shape[0]/cf
	width = img.shape[1]/cf
	r_img = sk.transform.resize(img, (img.shape[0]/cf, img.shape[1]/3, cf))
	g_img = greyout(r_img)
	f_img = gaussian_filter(g_img, ST_DEV)
	t_img = thresholder(f_img)
	return height, width, t_img
	edges = canny(t_img, 3)

	skio.imshow(r_img)
	skio.show()
	skio.imshow(f_img)
	skio.show()
	skio.imshow(t_img)
	skio.show()
	skio.imshow(edges)
	skio.show()

