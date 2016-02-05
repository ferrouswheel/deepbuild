# deepbuild

Tired of going through tedious build processes to get a function deep learning
environment, so time to automate all that stuff.

Starting with a bare ubuntu 14.04.3 LTS install, with only ubuntu-desktop installed
script will install the bare minimum, with all "extras" in a seperate venv

Ubuntu 14.04 Install script for:
- Nvidia graphic drivers for Titan X: 352
- Cuda 7.0 (7.5 gives "out of memory" issues)
- CuDNN3
- Theano (bleeding edge)
- Torch7
- ipython notebook (running as service with circus auto(re)boot on port 8888)
- itorch notebook (running as service with circus auto(re)boot on port 8889)
- Caffe 
- OpenCV 3.0 gold release (vs. 2015-06-04)
- Digits
- Lasagne
- Nolearn
- Keras

## Inspiration & Thanks

This is based off of the setup scripts of [graphific](https://gist.github.com/graphific),
but I wanted to wrap this up in a repo I can easily clone it and have it evolve as
I experiment with various libraries.

## TODO

- Make steps idempotent
- Dockerise with nvidia-docker

## Possible issues & fixes

### skimage: issue with "not finding jpeg decoder?" 

"[PIL: IOError: decoder zip not available](https://github.com/python-pillow/Pillow/issues/174)"

```
sudo apt-get install libtiff5-dev libjpeg8-dev zlib1g-dev \
     libfreetype6-dev liblcms2-dev libwebp-dev tcl8.6-dev tk8.6-dev python-tk
```

next try:

```
pip uninstall pillow
git clone https://github.com/python-pillow/Pillow.git
cd Pillow 
python setup.py install
```
