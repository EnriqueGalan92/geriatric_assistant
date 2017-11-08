#!/bin/bash

echo "Installing some dependencies"
echo "sudo apt-get install build-essential checkinstall"
sudo apt-get install build-essential checkinstall
echo "sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev"
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

echo ""
echo "Need to check what version of python is installed"
echo "Using python2 -version"
python2 --version
if [ $? -eq 0 ]; then
	echo "Python correctly installed"
else
	echo "Python will be installed"
	echo "sudo wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz"
	sudo wget https://www.python.org/ftp/python/2.7.13/Python-2.7.13.tgz
	echo "Untar the .tgz file"
	sudo tar xzf Python-2.7.13.tgz
fi

echo ""
echo "Verify that pip2 is installed"
echo "pip2 -V"
ret=$(pip2 -V)
if [[ $ret == *"2.7"* ]]; then
	echo "pip2 version recognized"
else
	echo "pip2 version NOT FOUND"
	echo "Please install, environment failed: exit"
fi

echo "Installing dependencies for the project"
echo "pip2 install numpy matplotlib scipy sklearn hmmlearn simplejson eyed3 pydub"
pip2 install numpy matplotlib scipy sklearn hmmlearn simplejson eyed3 pydub

echo "Rerunning if something failed"
pip2 install numpy matplotlib scipy sklearn hmmlearn simplejson eyed3 pydub

echo ""
echo "Decoder library"
echo "sudo apt-get install libav-tools"
sudo apt-get install libav-tools

echo ""
echo "Tkinter"
echo "sudo apt-get install python-tk"
sudo apt-get install python-tk

echo "************"
echo "Clonning repository"
echo "************"

echo ""
cd ~
mkdir pyAudio_project
cd pyAudio_project
echo "Project will be downloaded in ~/pyAudio_project"
echo "git clone https://github.com/tyiannak/pyAudioAnalysis.git"
git clone https://github.com/tyiannak/pyAudioAnalysis.git
echo ""
cd ~

echo "FINISHED SUCCESSFULLY"

exit
