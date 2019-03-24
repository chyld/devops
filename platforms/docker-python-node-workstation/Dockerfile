FROM ubuntu:18.10

# Environment variables
ENV DEBIAN_FRONTEND noninteractive

# System
RUN apt-get update 
RUN apt-get install -y apt-utils
RUN apt-get install -y \
	wget curl htop tree build-essential neofetch tmux \
	sqlite3 silversearcher-ag software-properties-common locales sudo unzip

# Locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# PPAs
RUN add-apt-repository ppa:git-core/ppa -y && add-apt-repository ppa:jonathonf/vim -y
RUN apt-get update && apt-get install -y git vim

# Download directory
WORKDIR /tmp

# Bat
RUN wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb && \
	apt-get install ./bat_0.10.0_amd64.deb

# Exa
RUN wget https://github.com/ogham/exa/releases/download/v0.8.0/exa-linux-x86_64-0.8.0.zip   && \
   	unzip exa-linux-x86_64-0.8.0.zip                                                        && \
   	mv exa-linux-x86_64 /usr/local/bin/exa

# Create user
RUN useradd -ms /bin/bash europa && usermod -aG sudo europa && echo "europa:europa" | chpasswd
USER europa
WORKDIR /home/europa

# Dotfiles
RUN rm .bashrc
ADD .gitconfig      .
ADD .tmux.conf      .
ADD .vimrc          .
ADD .bash_aliases   .
ADD .bash_colors    .
ADD .bash_env       .
ADD .bash_functions .
ADD .bash_misc      .
ADD .bash_prompt    .
ADD .bashrc         .

# Vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
	vim -c ':PlugInstall' -c 'qa'

# Python
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh         && \
	bash Miniconda3-latest-Linux-x86_64.sh -p /home/europa/.local/apps/miniconda3 -b   && \
	chmod -R 500 /home/europa/.local/apps/miniconda3                                   && \
	rm Miniconda3-latest-Linux-x86_64.sh

# Node
RUN wget https://nodejs.org/dist/v11.12.0/node-v11.12.0-linux-x64.tar.xz    && \
	tar -xf node-v11.12.0-linux-x64.tar.xz                                  && \
	mv node-v11.12.0-linux-x64 /home/europa/.local/apps/node

# Final
RUN source ~/.bashrc                   && \
    conda create -n py37 python=3.7
