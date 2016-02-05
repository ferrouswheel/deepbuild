#!/usr/bin/env bash
set -e

####################################
# Caffe
####################################

sudo apt-get install -y libprotobuf-dev libleveldb-dev \
  libsnappy-dev libopencv-dev libboost-all-dev libhdf5-serial-dev \
  libgflags-dev libgoogle-glog-dev liblmdb-dev protobuf-compiler \
  libatlas-base-dev libyaml-dev 
  
git clone https://github.com/BVLC/caffe.git

cp Makefile.config caffe/Makefile.config

cd caffe
# TODO: figure if there is a reason we're not using pip -r
for req in $(cat python/requirements.txt); do pip install $req -U; done

make all
make pycaffe
make test
make runtest
# using distribute places things in a nice dir, but misses examples and links
# without the .bin suffix
#make distribute

pip install networkx -U
pip install pillow -U

cd python
pip install -r requirements.txt

ln -s ~/caffe/python/caffe ~/venv/lib/python2.7/site-packages/caffe
echo -e "\nexport CAFFE_HOME=/home/$USER/caffe" >> ~/.bashrc
echo -e "\nexport PATH=/home/$USER/caffe/build/tools:$PATH" >> ~/.bashrc

echo "Installed Caffe"

