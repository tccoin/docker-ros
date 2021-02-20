FROM tccoin/docker-ros

WORKDIR /root

RUN sudo apt-get install -y ros-noetic-rosbridge-suite

ENTRYPOINT [ "/bin/bash", "-c" ]
CMD ["source /opt/ros/noetic/setup.bash && roslaunch rosbridge_server rosbridge_websocket.launch"]