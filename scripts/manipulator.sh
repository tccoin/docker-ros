#!/bin/bash
sed -i 's#!\/usr\/bin\/env #!\/usr\/bin\/#' /usr/local/lib/web/backend/run.py
sed -i 's#$USER:$USER $HOME#$USER:$USER $HOME\\.config#' /startup.sh

# architecture=$(dpkg --print-architecture)
# if [[ $architecture == "arm64" ]]; then
#     export LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 
# fi
nohup /startup.sh> vnc.log &
export DISPLAY=:1
source /root/catkin_ws/devel/setup.bash
