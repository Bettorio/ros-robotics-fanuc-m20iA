# tf-listener package

![ROSVersion](https://img.shields.io/badge/ROS-melodic-blue)
![c++](https://img.shields.io/badge/written%20in-c%2B%2B-green)
![build](https://img.shields.io/badge/build-passed-success)

This package implements a node, written in ```C++```, for the correct reading of the parameters that are published on the topic ```/tf```.
___

# Output preview

The node has been designed to show all the transformations connected to the robot joints, from the first to the last. What we can observe from the reported output example is that for each transformation there is a series of representations which are the ```Translation```, the ```Axis/Angle```, the ```Rotation Matrix``` and the ```Euler Angles``` expressed in roll, pitch, yaw.

```bash
[ INFO] [1605893996.188829564]: 

******** Tranformation from link_5 to link_6 *********

------- Translation -------
x: 0
y: 0
z: 0


------- Axis/Angle -------
Axis = [ -1 0 0 ]
Angle = [ 1.5708 ]

------- Rotation Matrix -------
[ 1 -0 0 ]
[ 0 -3.67321e-06 1 ]
[ -0 -1 -3.67321e-06 ]

------- Euler Angles -------
RPY = [ -1.5708 0 0 ]
```

___
##### Vittorio Fina