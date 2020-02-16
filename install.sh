# UPDATE UBUNTU
sudo apt-get -y update
sudo apt-get -y upgrade

# OPENCV DEPENDENCIES

sudo apt -y remove x264 libx264-dev
sudo apt -y install build-essential checkinstall cmake pkg-config yasm
sudo apt -y install git gfortran
sudo apt -y install libjpeg8-dev libpng-dev
sudo apt -y install software-properties-common
sudo add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"
sudo apt -y update 
sudo apt -y install libjasper1
sudo apt -y install libtiff-dev
sudo apt -y install libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev
sudo apt -y install libxine2-dev libv4l-dev
cd /usr/include/linux
sudo ln -s -f ../libv4l1-videodev.h videodev.h
cd "$cwd"
sudo apt -y install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev
sudo apt -y install libgtk2.0-dev libtbb-dev qt5-default
sudo apt -y install libatlas-base-dev
sudo apt -y install libfaac-dev libmp3lame-dev libtheora-dev
sudo apt -y install libvorbis-dev libxvidcore-dev
sudo apt -y install libopencore-amrnb-dev libopencore-amrwb-dev
sudo apt -y install libavresample-dev
sudo apt -y install x264 v4l-utils
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen

# PYTHON DEPENDENCIES
sudo apt -y install python3-dev python3-pip python3-vev
sudo -H pip3 install -U pip numpy
sudo apt -y install python3-testresources

# COPY OPENCV TO HOME
git clone https://github.com/opencv/opencv.git ~/opencv
cd ~/opencv
git checkout 3.4.6
git clone https://github.com/opencv/opencv_contrib.git ~/opencv_contrib
cd ~/opencv_contrib
git checkout 3.4.6

# MAKE OPENCV

cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/usr/local -D WITH_CUDA=ON -D ENABLE_FAST_MATH=1 -D CUDA_FAST_MATH=1 -D WITH_CUBLAS=1 -D INSTALL_PYTHON_EXAMPLES=ON -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules -D BUILD_EXAMPLES=ON -D BUILD_opencv_cudacodec=OFF -D WITH_NVCUVID=ON -D ENABLE_PRECOMPILED_HEADERS=OFF ..
make
sudo make install
sudo /bin/bash -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'
sudo ldconfig

# DARKET NET
git clone https://github.com/AlexeyAB/darknet.git
cd ~/darknet
rm -rf Makefile
cp -r ~/yolov3_setup/Makefile Makefile
wget https://pjreddie.com/media/files/yolov3.weights
wget https://pjreddie.com/media/files/yolov3-tiny.weights
sudo make
echo "Installation should be done now!"
