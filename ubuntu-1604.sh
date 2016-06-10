#!/bin/bash

GIT=2.8.4
NODE=6.2.1

# SYSTEM
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y screenfetch vim tmux tree htop build-essential libssl-dev libcurl4-openssl-dev libexpat1-dev

#DIRECTORIES
mkdir ~/Code
mkdir ~/Data
mkdir ~/Temp

# DOTFILES
cd ~
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.gitconfig
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.bash_profile
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.tmux.conf
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-1604/.vimrc
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
# npm install -g nodemon mocha gulp localtunnel jsdoc http-server jasmine chokidar-cli typescript babel-cli
npm install -g localtunnel http-server

# PYTHON
cd ~/Downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.local/conda
pip install httpie ipdb http-prompt
conda install -y jupyter numpy scipy sympy pandas statsmodels numexpr scikit-learn unicodecsv csvkit seaborn bokeh matplotlib

# ROBOMONGO
cd ~/Downloads
wget https://download.robomongo.org/0.9.0-rc8/linux/robomongo-0.9.0-rc8-linux-x86_64-c113244.tar.gz
tar -xvf robomongo-0.9.0-rc8-linux-x86_64-c113244.tar.gz 
mv robomongo-0.9.0-rc8-linux-x86_64-c113244 ~/.local/robomongo

# DOCKER
sudo apt-get install apt-transport-https ca-certificates
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo sh -c "echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' >> /etc/apt/sources.list.d/docker.list"
sudo apt-get update
sudo apt-get purge lxc-docker
apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install docker-engine -y
sudo service docker start
sudo groupadd docker
sudo usermod -aG docker chyld

# CONFIGURATION
cd ~/Downloads
# terminix
wget https://raw.githubusercontent.com/chyld/devops/master/configuration/ubunutu-1604/terminix/2016-05-14.txt
dconf load /com/gexperts/Terminix/ < 2016-05-14.txt
# vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
# atom
apm install git-time-machine pigments file-icons monokai tool-bar flex-tool-bar linter linter-eslint
wget https://raw.githubusercontent.com/chyld/devops/master/configuration/ubunutu-1604/atom/config.cson
wget https://raw.githubusercontent.com/chyld/devops/master/configuration/ubunutu-1604/atom/snippets.cson
wget https://raw.githubusercontent.com/chyld/devops/master/configuration/ubunutu-1604/atom/toolbar.cson
mv *.cson ~/.atom
# ipython
mkdir -p ~/.ipython/profile_default/startup
wget https://raw.githubusercontent.com/chyld/devops/master/configuration/ubunutu-1604/ipython/01-autoreload.ipy
mv *.ipy ~/.ipython/profile_default/startup

# CLEANUP
cd ~/Downloads
rm -rf *
