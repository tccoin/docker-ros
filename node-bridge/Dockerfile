FROM tccoin/docker-ros

WORKDIR /root/catkin_ws/

RUN pip3 install munch

COPY ws/node-bridge/ src/node-bridge/

RUN source /opt/ros/noetic/setup.bash \
    && catkin_make
