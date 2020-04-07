# -*- coding: utf-8 -*-
"""
Created on Wed Oct  9 18:13:36 2019

@author: ituran
"""
from mpl_toolkits import mplot3d

import numpy as np
import matplotlib.pyplot as plt

# CREATE THE POINTS ON SPHERE 

# Inputs
theta_max = 40      # angle above horizontal (0-90 deg)
theta_min = 70      # angle below horizontal (0-90 deg, can be positive or negative)
n = 500             # n = number of points on the sphere (full sphere, before cutting off range of vision)
 
golden_angle = np.pi * (3 - np.sqrt(5))
theta = golden_angle * np.arange(n)      # create an array with n elements
z = np.linspace(1 - 1.0 / n, 1.0 / n - 1, n)     # array with linear spacing from 1-1/n to 1/n-1 with n elements 
radius = np.sqrt(1 - z * z)
 
#selectTheta = np.array[(theta > theta.min) & (theta < theta.max)]

# Create points = array of n elements with [0, 0, 0]
points = np.zeros((n, 3))

points[:,0] = radius * np.cos(theta)
points[:,1] = radius * np.sin(theta)
points[:,2] = z

#select only points within range of vision
angle_max = abs(theta_max)/90
angle_min = -abs(theta_min)/90
selectPts = np.delete(points, np.where(np.logical_or(points[:,2]>angle_max, points[:,2]<=angle_min)), axis=0)




# Import the text file of points
input_file = r"Y:\ituran\NYCdaylight\ViewsTest\1015131_4\1015131_4.pts"

# Read the .pts text file and create ray with just x, y, z of points
pt_file = np.loadtxt(input_file, delimiter = " ")
grid_points = np.delete(pt_file, np.s_[3:6], axis=1)

grid_test = np.dstack([grid_points]*3)
print(grid_points[0])

print('test')
print(grid_test[0])


#==============================================================================
# 
# 
# # Plot test
# pts_x = selectPts[:,0]
# pts_y = selectPts[:,1]
# pts_z = selectPts[:,2]
# 
# fig = plt.figure()
# ax = fig.add_subplot(111, projection='3d')
# ax.scatter3D(pts_x, pts_y, pts_z)
#==============================================================================



