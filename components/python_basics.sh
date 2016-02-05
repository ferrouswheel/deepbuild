set -e

# Python basics: update pip and setup a virtualenv to avoid mixing packages
# installed from source with system packages
sudo apt-get update -y 
sudo apt-get install -y python-dev python-pip htop
sudo pip install -U pip virtualenv
if [ ! -d "venv" ]; then
    virtualenv venv
    echo "source ~/venv/bin/activate" >> ~/.bashrc
fi
source venv/bin/activate
pip install -U pip
pip install -U circus circus-web Cython Pillow

# Checkout this project to access installation script and additional resources
if [ ! -d "dl-machine" ]; then
    git clone git@github.com:deeplearningparis/dl-machine.git
    (cd dl-machine && git remote add http https://github.com/deeplearningparis/dl-machine.git)
else
    if  [ "$1" == "reset" ]; then
        (cd dl-machine && git reset --hard && git checkout master && git pull --rebase $REMOTE master)
    fi
fi

# Build numpy from source against OpenBLAS
# You might need to install liblapack-dev package as well
# sudo apt-get install -y liblapack-dev
rm -f ~/.numpy-site.cfg
ln -s dl-machine/numpy-site.cfg ~/.numpy-site.cfg
pip install -U numpy

# Build scipy from source against OpenBLAS
rm -f ~/.scipy-site.cfg
ln -s dl-machine/scipy-site.cfg ~/.scipy-site.cfg
pip install -U scipy

# Install common tools from the scipy stack
sudo apt-get install -y libfreetype6-dev libpng12-dev
pip install -U matplotlib ipython[all] pandas scikit-image

# Scikit-learn (generic machine learning utilities)
pip install -e git+git://github.com/scikit-learn/scikit-learn.git#egg=scikit-learn

