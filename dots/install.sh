#!/bin/bash

# Check if an argument was provided
if [ $# -eq 0 ]; then
    echo "No arguments provided. Usage: ./install.sh <mac or linux>"
    exit 1
fi

# Store the first argument in a variable
system="$1"

# Make directories
mkdir -p $HOME/.bin
mkdir -p $HOME/.config/{ghostty,uv}

# System agnostic
ln -s $HOME/Developer/devops/dots/.gitconfig             $HOME
ln -s $HOME/Developer/devops/dots/.tmux.conf             $HOME
ln -s $HOME/Developer/devops/dots/.bin/*                 $HOME/.bin
ln -s $HOME/Developer/devops/dots/.config/starship.toml  $HOME/.config
ln -s $HOME/Developer/devops/dots/.config/ghostty/config $HOME/.config/ghostty
ln -s $HOME/Developer/devops/dots/.config/uv/uv.toml     $HOME/.config/uv

# System specific 
case "$system" in
    "mac")
        echo "linking MAC specific files"
        ln -s $HOME/Developer/devops/dots/.zshrc__MAC    $HOME/.zshrc
        ;;
    "linux")
        echo "linking LINUX specific files"
        ln -s $HOME/Developer/devops/dots/.bashrc__LINUX $HOME/.bashrc
        ;;
    *)
        echo "Unknown argument: $system"
        ;;
esac

