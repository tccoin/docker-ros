# vnc
cp vnc/Dockerfile vnc/vnc-container/Dockerfile
docker build -t docker-ros/vnc vnc/vnc-container

# dev_base
docker build -t docker-ros/dev_base dev_base

# autoaim
docker build -t docker-ros/autoaim autoaim/

# webviz
docker build -t docker-ros/rosbridge rosbridge