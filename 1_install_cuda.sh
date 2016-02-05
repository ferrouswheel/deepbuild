#!/usr/bin/env bash

if [ "$(whoami)" == "root" ]; then
  echo "running as root, please run as user you want to have stuff installed as"
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

sudo apt-get update -y
sudo apt-get install -y git wget linux-image-generic build-essential unzip

# manual driver install with:
# sudo service lightdm stop
# (login on non graphical terminal)
# wget http://uk.download.nvidia.com/XFree86/Linux-x86_64/352.30/NVIDIA-Linux-x86_64-352.30.run
# chmod +x ./NVIDIA-Linux-x86_64-352.30.run
# sudo ./NVIDIA-Linux-x86_64-352.30.run

# Cuda 7.0
# instead we install the nvidia driver 352 from the cuda repo
# which makes it easier than stopping lightdm and installing in terminal
cd ~/
CUDA_DEB=cuda-repo-ubuntu1404_7.0-28_amd64.deb
if [ ! -e $CUDA_DEB ]; then
    wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1404/x86_64/$CUDA_DEB
fi
sudo dpkg -i $CUDA_DEB

cat >> ~/.bashrc <<'EOF'
export CUDA_HOME=/usr/local/cuda
export CUDA_ROOT=/usr/local/cuda
EOF
cat >> ~/.bashrc <<'EOF'
export PATH=/usr/local/cuda/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH
EOF

echo "CUDA installation complete: please reboot your machine and continue with script #2"
