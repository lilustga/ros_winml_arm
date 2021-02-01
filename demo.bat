call "c:\opt\ros\noetic\x64\setup.bat"
call "c:\embedded_world_demo\devel_isolated\setup.bat"
roslaunch k4a_arm_support k4a_demo.launch robot_ip:=192.168.1.111 -v