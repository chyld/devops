FROM archlinux:latest

ENV TZ America/Los_Angeles

RUN pacman -Syu --noconfirm
RUN pacman -S   --noconfirm base-devel
RUN pacman -S   --noconfirm just ncdu sqlite watchexec tmux shellcheck starship cowsay wget git unzip neovim vim ripgrep fd bat hexyl htop tree inetutils exa inotify-tools lua luarocks xclip fzf glow duf bpytop lazygit openssh

RUN useradd -ms /bin/bash chyld \
    && echo "chyld:chyld" | chpasswd \
    && echo 'chyld  ALL=(ALL:ALL) ALL' >> /etc/sudoers

USER chyld
WORKDIR /home/chyld

ARG NODE_VERSION=v20.5.0
RUN wget https://nodejs.org/dist/$NODE_VERSION/node-$NODE_VERSION-linux-x64.tar.xz \
    && tar -xf node-$NODE_VERSION-linux-x64.tar.xz   \
    && mkdir -p ~/.local                       \
    && mv node-$NODE_VERSION-linux-x64 ~/.local/node \
    && rm node*.tar.xz

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/chyld/.local/miniconda3 \
    && rm Miniconda3-latest-Linux-x86_64.sh

RUN mkdir X Code .config && cd Code && git clone --depth 1 https://github.com/chyld/devops

RUN rm .bash_profile .bashrc \ 
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.bash_profile . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.bashrc-nano .bashrc \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.gitconfig . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.tmux.conf . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/starship.toml ~/.config

SHELL ["/bin/bash", "--login", "-c"]

RUN npm install -g zx tldr

RUN conda create -y --name frodo python=3.11 -c conda-forge \
    && conda activate frodo \
    && conda install -y jupyterlab -c conda-forge \
    && pip install pandas numpy matplotlib \
    && pip install httpie

RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
    && ~/.tmux/plugins/tpm/bin/install_plugins

###
