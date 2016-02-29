#!/bin/bash

mkdir ~/downloads

cd ~/workspace
rm README.md

cd ~
rm .bash_aliases .gitconfig .gitignore
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-ec2/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/ubuntu-ec2/.gitconfig
source ~/.profile

nvm install 5.7
nvm alias default 5.7

sudo pip install httpie

curl -L "https://cli.run.pivotal.io/stable?release=linux64-binary&source=github" | tar -zx
sudo mv cf /bin

printf "\n\n\n"
echo "edit ~/.gitconfig"
echo "delete the devops directory"
echo "exit the terminal and restart"

