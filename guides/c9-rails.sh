#!/bin/bash

RUBY=2.4.1

rvm install ${RUBY}
rvm gemset create alpha
rvm use ${RUBY}@alpha --default
gem install rails

cd ~
rm .bash_aliases .gitconfig
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.bash_aliases
wget https://raw.githubusercontent.com/chyld/devops/master/dotfiles/c9/.gitconfig

echo "*************************************************************************"
echo "*************************************************************************"
echo "*************************************************************************"
echo "Done!"
echo "Exit Terminal and Restart"
echo "REMEMBER TO EDIT THE ~/.gitconfig"
echo "*************************************************************************"
echo "*************************************************************************"
echo "*************************************************************************"
