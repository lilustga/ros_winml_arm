# ros_winml_arm
Robot Arm Demo with ros_msft_onnx


# How to build this demo

```batch
:: open a ROS build window.
md c:\demo_ws
cd c:\demo_ws

:: download demo.rosinstall to c:\demo_ws
wstool init src demo.rosinstall

:: install the system dependencies and Python modules.
rosdep update
rosdep install --from-paths src --ignore-src -r -y

:: now build everything.
catkin_make_isolated --use-ninja --only-pkg-with-deps k4a_arm_support --merge
```

# How to run this demo

```batch
:: in the same ROS build window.

devel_isolated\setup.bat
roslaunch k4a_arm_support k4a_demo.launch robot_ip:=192.168.1.111 -v
```
# Useful commands

```batch
:: pickup engine block
rostopic pub --once /goto std_msgs/Int32 1
```