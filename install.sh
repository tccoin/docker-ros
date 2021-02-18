# git clone https://github.com/ConSol/vnc-container.git vnc/vnc-container
# cp vnc/.zshrc vnc/vnc-container/src/common/xfce/.zshrc
# cp vnc/Dockerfile vnc/vnc-container/Dockerfile
# docker build -t docker-ros/vnc vnc/vnc-container

docker build -t docker-ros/autoaim autoaim/
