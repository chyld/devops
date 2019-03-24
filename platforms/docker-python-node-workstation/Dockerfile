FROM ubuntu:18.10

# Environment variables
ENV DEBIAN_FRONTEND noninteractive

# System
RUN apt-get update 
RUN apt-get install -y apt-utils
RUN apt-get install -y \
	wget curl htop tree build-essential neofetch tmux \
	sqlite3 silversearcher-ag software-properties-common locales sudo

# Locales
RUN locale-gen en_US.UTF-8  
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

# PPAs
RUN add-apt-repository ppa:git-core/ppa -y && add-apt-repository ppa:jonathonf/vim -y
RUN apt-get update && apt-get install -y git vim

# Extra
WORKDIR /tmp
RUN wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb
RUN apt-get install ./bat_0.10.0_amd64.deb

# Create user
RUN useradd -ms /bin/bash europa && usermod -aG sudo europa && echo "europa:europa" | chpasswd
USER europa
WORKDIR /home/europa

# Dotfiles
RUN wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.gitconfig       && \
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.tmux.conf       && \	
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.vimrc           && \
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bash_aliases    && \	
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bash_colors     && \
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bash_env        && \	
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bash_functions  && \
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bash_misc       && \	
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bash_prompt     && \
	wget https://raw.githubusercontent.com/chyld/devops/master/platforms/docker-python-node-workstation/.bashrc 

# Vim
RUN curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
	vim -c ':PlugInstall' -c 'qa'

# Python
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh         && \
	bash Miniconda3-latest-Linux-x86_64.sh -p /home/europa/.local/apps/miniconda3 -b   && \
	chmod -R 500 /home/europa/.local/apps/miniconda3                                   && \
	rm Miniconda3-latest-Linux-x86_64.sh
