#!/usr/bin/env bash

set -e

####################################
# Digits
####################################

# Nvidia Digits needs a specific version of caffe
# so you can install the venv version by Nvidia uif you register
# with cudnn, cuda, and caffe already packaged
# instead we will install from scratch

# TODO: actually build and install the special version of caffe if this is useful:
# https://github.com/NVIDIA/DIGITS/blob/v2.0.0-preview/docs/InstallCaffe.md#grab-the-source
cd ~/

git clone https://github.com/NVIDIA/DIGITS.git digits

cd digits
pip install -r requirements.txt

sudo apt-get -y install graphviz

echo "digits installed, run with ./digits-devserver or 	./digits-server"

