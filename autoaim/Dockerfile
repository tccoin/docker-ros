FROM docker-ros/vnc

WORKDIR /root/build

RUN wget https://github.com/tccoin/galaxy-driver/releases/download/1.0/Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz \
    && tar -xf Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz \
    && rm Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122.tar.gz \
    && cd Galaxy_Linux-x86_Gige-U3_32bits-64bits_1.2.1911.9122/ \
    && echo '\n' | ./Galaxy_camera.run

RUN apt-get install software-properties-common -y \
    && add-apt-repository ppa:rock-core/qt4 \
    && apt-get update \
    && apt-get install libqtgui4 -y

WORKDIR /root/ws

# RUN git clone https://github.com/QiayuanLiao/galaxy_camera.git