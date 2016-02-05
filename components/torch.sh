#!/usr/bin/env bash
set -e

####################################
# Torch
####################################

if [ ! -d "torch" ]; then
    curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash
    git clone https://github.com/torch/distro.git ~/torch --recursive
    (cd ~/torch && yes | ./install.sh)
fi
. ~/torch/install/bin/torch-activate

if [ ! -d "iTorch" ]; then
    git clone git@github.com:facebook/iTorch.git
    (cd iTorch && git remote add http https://github.com/facebook/iTorch.git)
else
    if  [ "$1" == "reset" ]; then
        (cd iTorch && git reset --hard && git checkout master && git pull --rebase $REMOTE master)
    fi
fi
(cd iTorch && luarocks make)

cd ~/
git clone https://github.com/torch/demos.git torch-demos

#qt dependency
sudo apt-get install -y qt4-dev-tools libqt4-dev libqt4-core libqt4-gui

#main luarocks libs:
luarocks install image    # an image library for Torch7
luarocks install nnx      # lots of extra neural-net modules
luarocks install cutorch
luarocks cunn
#luarocks install unup # doesn't exist!!

echo "Installed Torch (demos in $HOME/torch-demos)"
