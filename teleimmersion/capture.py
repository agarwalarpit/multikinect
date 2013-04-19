
#! /usr/bin/env python

'''
###################################################################################
# Created by : asquared
# Description : awesomeness isn't built, it is BORN.
# File Name : capture.py
# Creation Date : 19-04-2013
# Last Modified Date : Fri Apr 19 14:33:57 2013
###################################################################################

Description format: 
Input: One line description of what comes as input to this file. 
Output: One line description of what goes out of this file.
Future: Points of what has to be done next. 
(Optional) Process: Include this section when we have some major algorithms and complex functions 
being implemented. Minor explanations can be included in the output section.  
 
Input: 

Output: 

Future: 

Process: 


'''

import cv
from freenect import sync_get_depth as get_depth, sync_get_video as get_video
import numpy
from OpenGL.GL import *
from OpenGL.GLU import *
import pygame
from pygame.locals import *
import os, sys
import random
from math import *
import OpenGL.GL
import pdb

pdb.set_trace()

xyz=numpy.empty((480,640,3))
indices=numpy.empty((480,640))
for i in range(480):
	for j in range(640):
		xyz[i][j][0] = j
		xyz[i][j][1] = i
		indices[i][j] = i*640+j

(depth,_),(rgb,_)=get_depth(),get_video()
depth=depth.flatten()
for i in range(480):
	for j in range(640):
		xyz[i][j][2] = depth[i*640+j]


def Draw(xyz,gl_rgb_tex,rgb,indices):
	glGenTextures(1, gl_rgb_tex);
	glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
	glLoadIdentity();
	zoom = 1
	glPushMatrix();
	glScalef(zoom,zoom,1);
	glTranslatef(0,0,-3.5);
	glRotatef(0, 1,0,0);
	glRotatef(0, 0,1,0);
	glTranslatef(0,0,1.5);
	LoadVertexMatrix();

	#Set the projection from the XYZ to the texture image
	glMatrixMode(GL_TEXTURE);
	glLoadIdentity();
	glScalef(1/640.0,1/480.0,1);
	LoadRGBMatrix();
	LoadVertexMatrix();
	glMatrixMode(GL_MODELVIEW);

	glPointSize(1);

	glEnableClientState(GL_VERTEX_ARRAY);
	glVertexPointer(3, GL_SHORT, 0, xyz);
	glEnableClientState(GL_TEXTURE_COORD_ARRAY);
	glTexCoordPointer(3, GL_SHORT, 0, xyz);

	glEnable(GL_TEXTURE_2D);
	glBindTexture(GL_TEXTURE_2D, 1);
	glTexEnvf( GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_MODULATE )
	glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR )
	gluBuild2DMipmaps( GL_TEXTURE_2D, 3, 640, 480, GL_RGB, GL_UNSIGNED_BYTE, rgb );

	glPointSize(2.0);
	glDrawElements(GL_POINTS, 640*480, GL_UNSIGNED_INT, indices);
	glPopMatrix();
	glDisable(GL_TEXTURE_2D);

