#!/bin/bash

GO_URL=https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
NODE_URL=https://nodejs.org/dist/v8.5.0/node-v8.5.0-linux-x64.tar.xz
CONDA_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
LOCAL=$HOME/.local

sudo apt-get update
sudo apt-get install -y htop tree libltdl7

# ------------------------------------------------------------------------------------------------------- #
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-from-a-package
# https://download.docker.com/linux/ubuntu/dists/
cd ~
wget https://download.docker.com/linux/ubuntu/dists/zesty/pool/stable/amd64/docker-ce_17.06.2~ce-0~ubuntu_amd64.deb -O docker.deb
sudo dpkg -i docker.deb
sudo usermod -a -G docker $USER
rm docker.deb
# ------------------------------------------------------------------------------------------------------- #

cd ~
mkdir $LOCAL
mkdir -p $HOME/{Code,Data}

# git install // system
curl ${GO_URL} | tar xz && mv go $LOCAL/go
curl ${NODE_URL} | tar xJ && mv node-v8.5.0-linux-x64 $LOCAL/node
wget ${CONDA_URL} -O conda.sh && bash conda.sh -b -p $LOCAL/miniconda3
rm conda.sh

cd $HOME/Code && git clone https://github.com/chyld/devops
cd ~

ln -s ~/Code/devops/dotfiles/vagrant/current/.tmux.conf .
ln -s ~/Code/devops/dotfiles/vagrant/current/.vimrc .
ln -s ~/Code/devops/dotfiles/vagrant/current/.gitconfig .

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

ln -s ~/Code/devops/dotfiles/vagrant/current/.bash_aliases .
ln -s ~/Code/devops/dotfiles/vagrant/current/.bash_profile .
ln -s ~/Code/devops/dotfiles/vagrant/current/.bash_colors .
