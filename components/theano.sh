set -e
####################################
# Theano
####################################
# installing theano
# By default, Theano will detect if it can use cuDNN. If so, it will use it. 
# To get an error if Theano can not use cuDNN, use this Theano flag: optimizer_including=cudnn.

pip install -e git+git://github.com/Theano/Theano.git#egg=Theano
if [ ! -f ".theanorc" ]; then
    ln -s ~/dl-machine/theanorc ~/.theanorc
fi

echo "Installed Theano"

