FROM docker-ros/dev_base

WORKDIR /root/build

RUN wget https://github.com/tccoin/container-static-files/releases/download/Galaxy_Linux/Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz -O - \
    | tar -zx \
    && cd Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122/ \
    && echo '\n' | ./Galaxy_camera.run

RUN wget https://github.com/tccoin/container-static-files/releases/download/Galaxy_Linux/Galaxy_Linux_Python_2.0.2008.9111.tar.gz -O - \
    | tar -zx

WORKDIR /root

SHELL ["/bin/bash", "-l", "-c"]

RUN mkdir -p catkin_ws/src \
    && cd catkin_ws \
    && git clone https://github.com/tccoin/galaxy_camera.git src/galaxy_camera \
    && source /opt/ros/noetic/setup.bash \
    && catkin_make

RUN PATH="$HOME/miniconda/bin:$PATH" conda install -y numpy opencv=3.4.2 python=3.7 -c menpo

RUN PATH="$HOME/miniconda/bin:$PATH" conda clean -afy

RUN /root/miniconda/bin/pip3 install opencv-contrib-python pyserial toolz

RUN cd ~/build/Galaxy_Linux_Python_2.0.2008.9111/api/ \
    && /root/miniconda/bin/pip3 install .