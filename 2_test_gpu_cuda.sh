#!/usr/bin/env bash

set -e

if [ "$(whoami)" == "root" ]; then
  echo "running as root, please run as user you want to have stuff installed as"
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

# Checking cuda installation
# installing the samples and checking the GPU
cuda-install-samples-7.0.sh ~/
cd NVIDIA\_CUDA-7.0\_Samples/1\_Utilities/deviceQuery  
make  

#Samples installed and GPU(s) Found ?
./deviceQuery  | grep "Result = PASS"
greprc=$?
if [[ $greprc -eq 0 ]] ; then
    echo "Cuda Samples installed and GPU found"
    echo "you can also check usage and temperature of gpus with nvidia-smi"
else
    if [[ $greprc -eq 1 ]] ; then
        echo "Cuda Samples not installed, exiting..."
        exit 1
    else
        echo "Some sort of error, exiting..."
        exit 1
    fi
fi

echo "now would be time to install cudnn for a speedup"
echo "unfortunately only available by registering on nvidias website:"
echo "https://developer.nvidia.com/cudnn"
echo "deep learning libraries can be installed with final script #3"

