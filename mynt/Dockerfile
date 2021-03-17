FROM tccoin/docker-ros

ENV ROS_DISTRO noetic

WORKDIR /root/build

RUN apt-get install --no-install-recommends -y libusb-dev \
    && git clone https://github.com/tccoin/MYNT-EYE-D-SDK.git mynt-eye-d-sdk \
    && cd mynt-eye-d-sdk \
    && make init \
    && source /opt/ros/noetic/setup.bash \
    && make all