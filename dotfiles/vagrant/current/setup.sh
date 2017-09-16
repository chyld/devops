#!/bin/bash

GO_URL=https://storage.googleapis.com/golang/go1.9.linux-amd64.tar.gz
NODE_URL=https://nodejs.org/dist/v8.5.0/node-v8.5.0-linux-x64.tar.xz
CONDA_URL=https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
LOCAL=$HOME/.local

sudo apt-get update
sudo apt-get install -y htop tree

cd ~
mkdir $LOCAL
mkdir -p $HOME/{Code,Data}

# git install // system
curl ${GO_URL} | tar xz && mv go $LOCAL/go
curl ${NODE_URL} | tar xJ && mv node-v8.5.0-linux-x64 $LOCAL/node
wget ${CONDA_URL} -O conda.sh && bash conda.sh -b -p $LOCAL/miniconda3

cd $HOME/Code && git clone https://github.com/chyld/devops
