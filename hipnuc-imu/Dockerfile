FROM tccoin/docker-ros

WORKDIR /root/catkin_ws

RUN git clone https://github.com/wjwwood/serial/ src/serial

RUN git clone https://github.com/RoboVigor/hipnuc_ros.git src/hipnuc_ros

RUN source /opt/ros/noetic/setup.bash \
    && catkin_make
