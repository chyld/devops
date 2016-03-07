#!/bin/bash

sudo apt-get update
sudo apt-get install -y apache2-utils

mkdir ~/downloads

cd ~
rm .bash_aliases .gitconfig .gitignore
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-ec2/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-ec2/.gitconfig
source ~/.profile

nvm install 5.7
nvm alias default 5.7
nvm use 5.7
npm install -g nodemon mocha gulp

sudo pip install httpie

curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
sudo mv cf /bin

exit
