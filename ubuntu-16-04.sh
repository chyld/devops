#!/bin/bash

GIT=2.8.2
NODE=6.1

# SYSTEM
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y vim tmux tree htop

#DIRECTORIES
mkdir ~/Code
mkdir ~/Temp

# DOTFILES
cd ~
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.gitconfig
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.bash_profile
source ~/.bash_profile

# NODE
# cd ~
# nvm install ${NODE}
# nvm alias default ${NODE}
# nvm use ${NODE}
# npm install -g nodemon mocha gulp localtunnel jsdoc http-server jasmine chokidar-cli typescript

# PYTHON
cd ~/Downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.local/conda
pip install httpie
