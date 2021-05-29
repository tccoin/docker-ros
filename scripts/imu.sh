#!/bin/bash
source /root/catkin_ws/devel/setup.bash
# cd /root/catkin_ws/
# catkin_make
ls /dev/serial/by-id/
roslaunch serial_imu imu_msg.launch imu_package:=0x91
