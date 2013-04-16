import numpy
import cv
from freenect import sync_get_depth as get_depth, sync_get_rgb as get_video
while True: 
	(depth,_),(rgb,_)=get_depth(),get_video()
	depth=depth.astype(numpy.uint8)
	cv.ShowImage("depth",depth)
	cv.ShowImage("depth",rgb)
