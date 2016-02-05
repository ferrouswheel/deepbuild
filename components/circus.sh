#!/usr/bin/env bash

set -e

# Register the circus daemon with Upstart
if [ ! -f "/etc/init/circus.conf" ]; then
    sudo ln -s $HOME/dl-machine/circus.conf /etc/init/circus.conf
    sudo initctl reload-configuration
fi
sudo service circus restart

cd ~/
