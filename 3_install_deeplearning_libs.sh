#!/usr/bin/env bash
# Installation script for Deep Learning Libraries on Ubuntu 14.04
# Adapted from scripts by Roelof Pieters (@graphific)
# and from 
# https://github.com/deeplearningparis/dl-machine/blob/master/scripts/install-deeplearning-libraries.sh

# BSD License

set -e

if [ "$(whoami)" == "root" ]; then
  echo "running as root, please run as user you want to have stuff installed as"
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y libncurses-dev

####################################
# Dependencies
####################################

bash components/openblas_for_python.sh
bash components/python_basics.sh
bash components/opencv.sh
bash components/theano.sh
bash components/tutorial.sh
bash components/torch.sh
bash components/circus.sh
bash components/caffe.sh
# Digits is a webservice from NVIDIA for deep learning
# https://developer.nvidia.com/digits
bash components/digits.sh
bash components/lasagne.sh
bash components/nolearn.sh

#### Install tensorflow
# Ubuntu/Linux 64-bit, CPU only:
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.6.0-cp27-none-linux_x86_64.whl

# Ubuntu/Linux 64-bit, GPU enabled:
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.6.0-cp27-none-linux_x86_64.whl
####

bash components/keras.sh

echo "all done, please restart your machine..."
