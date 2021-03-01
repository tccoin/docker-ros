#!/bin/bash
sed -i 's#!\/usr\/bin\/env #!\/usr\/bin\/#' /usr/local/lib/web/backend/run.py
sed -i 's#$USER:$USER $HOME#$USER:$USER $HOME\\.config#' /startup.sh
export LD_PRELOAD=/lib/aarch64-linux-gnu/libgcc_s.so.1 
dconf load /com/gexperts/Tilix/ < tilix.dconf
nohup /startup.sh> vnc.log &
export DISPLAY=:1
/bin/zsh