#!/usr/bin/bash
#
# # #

cd /home/chyld/Code/devops/platforms/mint-ubuntu/v011
git checkout .gitconfig
sudo rm /etc/gitconfig

git config -l --global
git config -l --system

# # #
#

