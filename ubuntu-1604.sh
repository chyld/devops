#!/bin/bash

GIT=2.8.2
NODE=6.1.0

# SYSTEM
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim tmux tree htop build-essential libssl-dev libcurl4-openssl-dev libexpat1-dev

#DIRECTORIES
mkdir ~/Code
mkdir ~/Temp

# DOTFILES
cd ~
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.gitconfig
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.bash_profile
source ~/.bash_profile

# GIT
cd ~/Downloads
wget https://www.kernel.org/pub/software/scm/git/git-${GIT}.tar.xz
tar -xvf git-${GIT}.tar.xz
cd ~/Downloads/git-${GIT}
make prefix=/home/chyld/.local/git all
make prefix=/home/chyld/.local/git install

# NODE
cd ~/Downloads
wget https://nodejs.org/dist/v${NODE}/node-v${NODE}-linux-x64.tar.xz
tar -xvf node-v${NODE}-linux-x64.tar.xz 
mv node-v${NODE}-linux-x64 ~/.local/node
npm install -g nodemon mocha gulp localtunnel jsdoc http-server jasmine chokidar-cli typescript

# PYTHON
cd ~/Downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.local/conda
pip install httpie
conda install jupyter numpy scipy sympy matplotlib pandas unicodecsv seaborn numexpr

# CLEANUP
cd ~/Downloads
rm -rf *