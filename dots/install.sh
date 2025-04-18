#!/bin/bash

# Icons -- https://www.flaticon.com/
# Check if an argument was provided
if [ $# -eq 0 ]; then
  echo "No arguments provided. Usage: ./install.sh <mac or linux>"
  exit 1
fi

# Store the first argument in a variable
system="$1"

# Make directories
mkdir -p $HOME/.bin
mkdir -p $HOME/.config/{ghostty,uv,mpv}
mkdir -p $HOME/.local/share/nautilus/scripts
mkdir -p $HOME/.local/share/nautilus-python/extensions

# System agnostic files
ln -s $HOME/Developer/devops/dots/.gitconfig $HOME
ln -s $HOME/Developer/devops/dots/.tmux.conf $HOME
ln -s $HOME/Developer/devops/dots/.bin/* $HOME/.bin
ln -s $HOME/Developer/devops/dots/.config/starship.toml $HOME/.config
ln -s $HOME/Developer/devops/dots/.config/ghostty/config $HOME/.config/ghostty
ln -s $HOME/Developer/devops/dots/.config/uv/uv.toml $HOME/.config/uv
ln -s $HOME/Developer/devops/dots/.config/mpv/* $HOME/.config/mpv
ln -s $HOME/Developer/devops/dots/.local/share/nautilus/scripts/* $HOME/.local/share/nautilus/scripts
ln -s $HOME/Developer/devops/dots/.local/share/nautilus-python/extensions/* $HOME/.local/share/nautilus-python/extensions
ln -s $HOME/Developer/devops/dots/.local/share/applications/* $HOME/.local/share/applications

# System agnostic directories
cp -r $HOME/Developer/devops/dots/.dockerfiles $HOME

# System specific
case "$system" in
"mac")
  echo "linking MAC specific files"
  ln -s $HOME/Developer/devops/dots/.zshrc__MAC $HOME/.zshrc
  ;;
"linux")
  echo "linking LINUX specific files"
  ln -s $HOME/Developer/devops/dots/.bashrc__LINUX $HOME/.bashrc
  ;;
*)
  echo "Unknown argument: $system"
  ;;
esac
