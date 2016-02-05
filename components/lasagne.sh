#!/usr/bin/env bash

set -e

####################################
# Lasagne
# https://github.com/Lasagne/Lasagne
####################################
git clone https://github.com/Lasagne/Lasagne.git
cd Lasagne
python setup.py install

echo "Lasagne installed"

