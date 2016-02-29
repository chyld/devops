#!/bin/bash

cd ~
rm .bash_aliases .gitconfig .gitignore
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-ec2/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-ec2/.gitconfig

cd ~/template
rm README.md

nvm install 5.7
nvm alias default 5.7

exit

sudo pip install httpie

mkdir ~/downloads
cd ~/downloads
wget -O cf.deb https://cli.run.pivotal.io/stable?release=debian64&version=6.15.0&source=github-rel
sudo dpkg -i cf.deb
rm cf.deb
