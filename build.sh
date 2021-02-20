# docker build -t tccoin/docker-ros . --squash
docker build -t tccoin/docker-ros .
# webviz
docker build -t tccoin/docker-ros:rosbridge webviz
# kinect
# docker build -t tccoin/docker-ros:kinect kinect