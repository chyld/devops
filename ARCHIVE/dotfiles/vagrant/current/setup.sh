#!/bin/bash

GO_URL=https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
NODE_URL=https://nodejs.org/dist/v8.5.0/node-v8.5.0-linux-x64.tar.xz
CONDA_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
LOCAL=$HOME/.local

# system
sudo add-apt-repository -y ppa:jonathonf/vim
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update
sudo apt-get install -y git htop tree libltdl7 postgresql-client vim unzip

# ------------------------------------------------------------------------------------------------------- #
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-from-a-package
# https://download.docker.com/linux/ubuntu/dists/
cd ~
wget https://download.docker.com/linux/ubuntu/dists/xenial/pool/stable/amd64/docker-ce_17.03.2~ce-0~ubuntu-xenial_amd64.deb -O docker.deb
sudo dpkg -i docker.deb
sudo usermod -a -G docker $USER
rm docker.deb
# ------------------------------------------------------------------------------------------------------- #

# directories
cd ~
mkdir $LOCAL
mkdir -p $HOME/{Code,Data,Temp}
mkdir -p $HOME/Code/go/{bin,pkg,src}

# go, node, python
curl ${GO_URL} | tar xz && mv go $LOCAL/go
curl ${NODE_URL} | tar xJ && mv node-v8.5.0-linux-x64 $LOCAL/node
wget ${CONDA_URL} -O conda.sh && bash conda.sh -b -p $LOCAL/miniconda3
rm conda.sh

# code
cd $HOME/Code && git clone https://github.com/chyld/devops
cd ~

# tmux
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .

# dotfiles
ln -s ~/Code/devops/dotfiles/vagrant/current/.vimrc .
ln -s ~/Code/devops/dotfiles/vagrant/current/.gitconfig .
ln -s ~/Code/devops/dotfiles/vagrant/current/.bash_aliases .
ln -s ~/Code/devops/dotfiles/vagrant/current/.bash_profile .
ln -s ~/Code/devops/dotfiles/vagrant/current/.bash_colors .

# setup vim
source $HOME/.bash_profile
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/colors/molokai.vim --create-dirs https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim

for x in {1..5}
do
  vim +PlugInstall +qall
done

# data science
conda install -y scipy numpy jupyter sympy pandas matplotlib seaborn bokeh statsmodels
pip install httpie sklearn

# node
npm install -g prettier
