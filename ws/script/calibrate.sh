cd /root/build
git clone https://github.com/ceres-solver/ceres-solver.git
# sudo apt-get install -y cmake libgoogle-glog-dev libgflags-dev libatlas-base-dev libeigen3-dev libsuitesparse-dev
mkdir ceres-bin
cd ceres-bin
cmake ../ceres-solver
make -j6
make test
make install

cd ~/catkin_ws \
    && git clone https://github.com/gaowenliang/code_utils.git src/code_utils \
    && catkin_make \
    && git clone https://github.com/gaowenliang/imu_utils.git src/imu_calib \
    && catkin_make

rosrun camera_calibration cameracalibrator.py --no-service-check --approximate 0.1 --size 8x6 --square 0.026 right:=/camera/right/image_raw left:=/camera/left/image_raw right_camera:=/camera/right left_camera:=/camera/left