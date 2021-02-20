FROM docker-ros/dev_base

WORKDIR /root/build

RUN wget https://github.com/tccoin/container-static-files/releases/download/Galaxy_Linux/Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz \
    && tar -xf Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz \
    && rm Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz \
    && cd Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122/ \
    && echo '\n' | ./Galaxy_camera.run

WORKDIR /root

SHELL ["/bin/bash", "-l", "-c"]

RUN mkdir -p catkin_ws/src \
    && cd catkin_ws \
    && git clone https://github.com/tccoin/galaxy_camera.git src/galaxy_camera \
    && source /opt/ros/noetic/setup.bash \
    && catkin_make
