FROM tccoin/docker-ros

WORKDIR /root/catkin_ws/

RUN pip3 install munch

RUN git clone https://github.com/RoboVigor/RV-Node-Bridge.git src/node_bridge/

RUN source /opt/ros/noetic/setup.bash \
    && catkin_make
