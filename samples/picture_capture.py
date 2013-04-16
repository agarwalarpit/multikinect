#!/usr/bin/env python2.7
import cv
 
cv.NamedWindow("w1", cv.CV_WINDOW_AUTOSIZE)
  
camera_index = 0
capture = cv.CaptureFromCAM(camera_index)
   
frame = cv.QueryFrame(capture)
cv.SaveImage("pic.jpg", frame)
