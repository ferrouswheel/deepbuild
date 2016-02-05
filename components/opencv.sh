set -e
####################################
# OPENCV 3
####################################
# from http://rodrigoberriel.com/2014/10/installing-opencv-3-0-0-on-ubuntu-14-04/
# for 2.9 see http://www.samontab.com/web/2014/06/installing-opencv-2-4-9-in-ubuntu-14-04-lts/ 
cd ~/
sudo apt-get -y install libopencv-dev build-essential cmake git libgtk2.0-dev \
   pkg-config python-dev python-numpy libdc1394-22 libdc1394-22-dev libjpeg-dev \
   libpng12-dev libtiff4-dev libjasper-dev libavcodec-dev libavformat-dev \
   libswscale-dev libxine-dev libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
   libv4l-dev libtbb-dev libqt4-dev libfaac-dev libmp3lame-dev libopencore-amrnb-dev \
   libopencore-amrwb-dev libtheora-dev libvorbis-dev libxvidcore-dev x264 v4l-utils unzip

wget https://github.com/Itseez/opencv/archive/3.0.0.tar.gz -O opencv-3.0.0.tar.gz
tar -zxvf  opencv-3.0.0.tar.gz

cd opencv-3.0.0
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_TBB=ON -D BUILD_NEW_PYTHON_SUPPORT=ON -D WITH_V4L=ON -D WITH_QT=ON -D WITH_OPENGL=ON ..
make -j $(nproc)
sudo make install

sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig
ln -s /usr/lib/python2.7/dist-packages/cv2.so /home/$USER/venv/lib/python2.7/site-packages/cv2.so

echo "opencv 3.0 installed"

