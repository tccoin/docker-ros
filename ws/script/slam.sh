#!/bin/bash
sed -i 's#!\/usr\/bin\/env #!\/usr\/bin\/#' /usr/local/lib/web/backend/run.py
sed -i 's#$USER:$USER $HOME#$USER:$USER $HOME\\.config#' /startup.sh

architecture=$(dpkg --print-architecture)
if [[ $architecture == "arm64" ]]; then
    export LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 
fi
nohup /startup.sh> vnc.log &
export DISPLAY=:1


# cd /root/build/ORB_SLAM2/
# source Examples/ROS/ORB_SLAM2/build/devel/setup.bash
# rosrun ORB_SLAM2 Stereo ./Vocabulary/ORBvoc.txt ./config/mynteye_d_stereo.yaml true
# rosrun ORB_SLAM2 mynteye_d_stereo ./Vocabulary/ORBvoc.txt ./config/mynteye_d_stereo.yaml false /mynteye/left/image_mono /mynteye/right/image_mono

cd /root/build/ORB_SLAM3/
source Examples/ROS/ORB_SLAM3/build/devel/setup.zsh
rosrun ORB_SLAM3 Stereo_Inertial ./Vocabulary/ORBvoc.txt ./config/mynteye_d_stereo.yaml data_raw true