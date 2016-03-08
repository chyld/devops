#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2-utils libcurl4-openssl-dev

mkdir ~/downloads && cd ~/downloads
wget https://www.kernel.org/pub/software/scm/git/git-2.7.2.tar.xz
tar -xvf git-2.7.2.tar.xz
cd ~/downloads/git-2.7.2
make prefix=/home/ubuntu/.local/git all
make prefix=/home/ubuntu/.local/git install
cd ~/downloads && rm -rf git*

cd ~
rm .bash_aliases .gitconfig .gitignore
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.gitconfig
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.bash_profile
source ~/.profile
source ~/.bash_profile

nvm install 5.7
nvm alias default 5.7
nvm use 5.7
npm install -g nodemon mocha gulp

sudo pip install httpie

curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
sudo mv cf /bin

echo "Done!"
echo "Exit Terminal and Restart"
