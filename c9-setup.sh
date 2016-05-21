#!/bin/bash

GIT=2.8.3
NODE=6.2

# DOWNLOAD DIRECTORY
mkdir ~/downloads

# CURL & APACHE BENCH
cd ~
sudo apt-get update
sudo apt-get install -y apache2-utils libcurl4-openssl-dev

# GIT
cd ~/downloads
wget https://www.kernel.org/pub/software/scm/git/git-${GIT}.tar.xz
tar -xvf git-${GIT}.tar.xz
cd ~/downloads/git-${GIT}
make prefix=/home/ubuntu/.local/git all
make prefix=/home/ubuntu/.local/git install
cd ~/downloads
rm -rf git*

# WHISK
cd ~/downloads
wget -O whisk.tar.gz https://new-console.ng.bluemix.net/openwhisk/cli/download
sudo pip install whisk.tar.gz
rm whisk*

# DOTFILES
cd ~
rm .bash_aliases .gitconfig .gitignore
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.gitconfig
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.bash_profile
source ~/.profile
source ~/.bash_profile

# NODE
cd ~
nvm install ${NODE}
nvm alias default ${NODE}
nvm use ${NODE}
echo Node Location: $(which node)
npm install -g nodemon mocha gulp localtunnel jsdoc http-server jasmine chokidar-cli

# PYTHON
cd ~/downloads
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b -p ~/.local/conda
rm Miniconda3-latest-Linux-x86_64.sh
echo Conda Location: $(which conda)
pip install httpie

# CLOUD FOUNDRY
cd ~/downloads
curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
sudo mv cf /bin

### DONE
echo "*************************************************************************"
echo "*************************************************************************"
echo "*************************************************************************"
echo "Done!"
echo "Exit Terminal and Restart"
echo "REMEMBER TO EDIT THE ~/.gitconfig"
echo "*************************************************************************"
echo "*************************************************************************"
echo "*************************************************************************"
