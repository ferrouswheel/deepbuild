#!/usr/bin/env bash

set -e

####################################
# Keras
# https://github.com/fchollet/keras
# http://keras.io/
####################################
git clone https://github.com/fchollet/keras.git
cd keras
python setup.py install

echo "Keras installed"

