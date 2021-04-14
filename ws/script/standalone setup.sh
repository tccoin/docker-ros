################################################################################
# PROXY
################################################################################

export HTTP_PROXY="http://192.168.137.1:10809" 
    HTTPS_PROXY="http://192.168.137.1:10809"
    http_proxy="http://192.168.137.1:10809" 
    https_proxy="http://192.168.137.1:10809"
    use_proxy=yes

sudo touch /etc/apt/apt.conf.d/proxy.conf
sudo chmod 777 /etc/apt/apt.conf.d/proxy.conf
sudo echo "Acquire::http::Proxy \"http://192.168.137.1:10809\";" > /etc/apt/apt.conf.d/proxy.conf
sudo echo "Acquire::http::Proxy \"http://192.168.137.1:10809\";" >> /etc/apt/apt.conf.d/proxy.conf
sudo cat /etc/apt/apt.conf.d/proxy.conf

# ################################################################################
# # Development Tools
# ################################################################################

# install build dependency
# sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list
sudo apt-get update
sudo apt-get install --no-install-recommends -y nano build-essential python3-setuptools python3-pip 

# install zsh
git clone https://github.com/tccoin/easy-linux.git
cd easy-linux
./zsh.sh
touch ~/.z

# install gitstatus
# https://github.com/romkatv/gitstatus/releases/tag/v 1.3.1
mkdir -p ~/.cache/gitstatus
wget https://github.com/romkatv/gitstatus/releases/download/v1.3.1/gitstatusd-linux-aarch64.tar.gz  -e use_proxy=yes -e https_proxy=192.168.137.1:10809 -O - | tar -zx -C ~/.cache/gitstatus/

# install conda
wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-aarch64.sh  -e use_proxy=yes -e https_proxy=192.168.137.1:10809 -O ~/miniconda.sh
bash ~/miniconda.sh -b -p $HOME/miniconda
rm ~/miniconda.sh

sudo ln ~/miniconda/bin/python3.8 /usr/bin/python3.8
sudo ln ~/miniconda/bin/pip3 /usr/bin/pip3.8

# ################################################################################
# # Program Dependency
# ################################################################################

mkdir ~/build
cd ~/build
wget https://github.com/tccoin/container-static-files/releases/download/Galaxy_Linux/Galaxy_Linux_Python_2.0.2008.9111.tar.gz -e use_proxy=yes -e https_proxy=192.168.137.1:10809 -O - | tar -zx
cd Galaxy_Linux_Python_2.0.2008.9111/api/
pip3.8 install .

cd ~/build
wget https://github.com/tccoin/container-static-files/releases/download/Galaxy_Linux/Galaxy_Linux-armhf_Gige-U3_32bits-64bits_1.3.1911.9271.tar.gz -e use_proxy=yes -e https_proxy=192.168.137.1:10809 -O - | tar -zx
cd Galaxy_Linux-armhf_Gige-U3_32bits-64bits_1.3.1911.9271/
./Galaxy_camera.run

cd ~

pip3.8 install numpy 'opencv-python>=3.4,<3.5' 'opencv-contrib-python>=3.4,<3.5' pyserial toolz pyyaml bitstring --proxy http://192.168.137.1:10809

# echo "export PYTHONPATH=\"/home/dji/miniconda/lib/python3.8/site-packages:$PYTHONPATH\"" >> ~/.bashrc
