#!/bin/bash

NODE=10.12.0

# DOWNLOAD DIRECTORY
mkdir ~/downloads

# NODE
cd ~
source $HOME/.nvm/nvm.sh
nvm install ${NODE}
nvm alias default ${NODE}
nvm use ${NODE}

# PYTHON
cd ~/downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.local/conda

# JAVA
sudo yum -y update
sudo yum -y install java-1.8.0-openjdk-devel
sudo update-alternatives --set java /usr/lib/jvm/jre-1.8.0-openjdk.x86_64/bin/java
sudo update-alternatives --set javac /usr/lib/jvm/java-1.8.0-openjdk.x86_64/bin/javac

cd ~/downloads
wget http://mirror.metrocast.net/apache/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz
tar -xvf apache-maven-3.5.4-bin.tar.gz
mv apache-maven-3.5.4 ~/.local/maven

# CLEAN UP
cd ~/downloads
rm -rf *

### DONE
echo "*************************************************************************"
echo "*************************************************************************"
echo "*************************************************************************"
echo "Done!"
echo "*************************************************************************"
echo "*************************************************************************"
echo "*************************************************************************"
