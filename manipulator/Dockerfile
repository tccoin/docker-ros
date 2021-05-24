FROM tccoin/docker-ros:node-bridge

WORKDIR /root/catkin_ws

RUN git clone https://github.com/wjwwood/serial.git src/serial/
RUN git clone https://github.com/RoboVigor/gold-miner-robot.git src/gold_miner_robot
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    ros-noetic-moveit \
    ros-noetic-moveit-resources-prbt-moveit-config \
    ros-noetic-pilz-industrial-motion-planner
RUN source /opt/ros/noetic/setup.bash \
    && catkin_make
