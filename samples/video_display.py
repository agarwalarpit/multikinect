import cv
 
CAMERA_INDEX = 1
  
cv.NamedWindow("Video", cv.CV_WINDOW_AUTOSIZE)
capture = cv.CaptureFromCAM(CAMERA_INDEX)
   
while True:
	frame = cv.QueryFrame(capture)
	cv.ShowImage("w1", frame)
