#!/usr/bin/bash
#
# # #

name=$1
cd ~/Boxes
cp -r alpha $name

cd ~
distrobox create --clone alpha --name $name --home /home/chyld/Boxes/$name

# # #
#

