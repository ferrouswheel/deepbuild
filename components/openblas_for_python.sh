#!/usr/bin/env bash

set -e

# Build latest stable release of OpenBLAS without OPENMP to make it possible
# to use Python multiprocessing and forks without crash
# The torch install script will install OpenBLAS with OPENMP enabled in
# /opt/OpenBLAS so we need to install the OpenBLAS used by Python in a
# distinct folder.
# Note: the master branch only has the release tags in it
sudo apt-get install -y gfortran
export OPENBLAS_ROOT=/opt/OpenBLAS-no-openmp
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OPENBLAS_ROOT/lib
if [ ! -d "OpenBLAS" ]; then
    git clone -q --branch=master git://github.com/xianyi/OpenBLAS.git
    (cd OpenBLAS \
      && make FC=gfortran USE_OPENMP=0 NO_AFFINITY=1 NUM_THREADS=$(nproc) \
      && sudo make install PREFIX=$OPENBLAS_ROOT)
    echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH" >> ~/.bashrc
fi
sudo ldconfig
