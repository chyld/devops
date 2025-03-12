#!/usr/bin/bash

cat /etc/pacman.d/mirrorlist | rg -i server | head -n 3
sudo reflector --latest 10 --protocol http,https --save /etc/pacman.d/mirrorlist
cat /etc/pacman.d/mirrorlist | rg -i server | head -n 3
yay
read -s -n1 -p "Press any key to close the terminal..."

