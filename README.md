# ros-robotics-fanuc-m20iA

![ROSVersion](https://img.shields.io/badge/ROS-melodic-blue)
![build](https://img.shields.io/badge/build-passed-success)

This package deals with showing in rviz the model of the Fanuc-RM-20iA robot through the implementation of the corresponding Universal Robot Description Format.

Implemented with [ROS (Robot Operating System)](http://wiki.ros.org/) and C++.  
___
# The task
The following is the task for which this repository was developed.

> Derive the Denavit-Hartenberg parameters for the Fanuc Robot.
> 
> Translate the D-H parameters to URDF and visualize the Fanuc Robot in RViz with urdf_tutorial display.launch.
>
> Create a fanuc_moveit_config package and visualize the robot in RViz.
>
> Write one or more ROS nodes to compute and print the TF of the end-effector in all the reference frames of all joints. From the TF, compute the translational vector, the rotation matrix, the Euler angles and the axis-angle representation.
>
> Verify the results by comparing with manual/MATLAB calculations.
___

##### Vittorio Fina