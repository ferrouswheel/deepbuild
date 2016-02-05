#!/usr/bin/env bash

set -e

####################################
# Nolearn
# asbtractions, mainly around Lasagne
# https://github.com/dnouri/nolearn
####################################
git clone https://github.com/dnouri/nolearn
cd nolearn
pip install -r requirements.txt
python setup.py install

echo "nolearn wrapper installed"

