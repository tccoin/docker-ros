FROM tccoin/docker-ros

WORKDIR /root/catkin_ws

RUN pip3 install munch

RUN sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list' \
&& sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654 \
&& apt-get update

RUN apt-get install -y --no-install-recommends \
    ros-noetic-moveit \
    ros-noetic-moveit-resources-prbt-moveit-config \
    ros-noetic-pilz-industrial-motion-planner

RUN git clone https://github.com/RoboVigor/RV-Node-Bridge.git src/node_bridge/

RUN git clone https://github.com/wjwwood/serial.git src/serial/

RUN git clone https://github.com/RoboVigor/gold-miner-robot.git src/gold_miner_robot

RUN git clone https://github.com/RoboVigor/hipnuc_ros.git src/hipnuc_ros

RUN source /opt/ros/noetic/setup.bash \
    && catkin_make
