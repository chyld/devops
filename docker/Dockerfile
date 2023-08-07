FROM archlinux:latest

ENV TZ America/Los_Angeles

RUN pacman -Sy --noconfirm
RUN pacman -S  --noconfirm just ncdu sqlite watchexec tmux shellcheck starship cowsay wget git unzip neovim vim ripgrep fd bat hexyl htop tree inetutils exa inotify-tools lua luarocks xclip fzf glow duf bpytop lazygit openssh
RUN pacman -S  --noconfirm --needed base-devel

RUN useradd -ms /bin/bash chyld \
    && echo "chyld:chyld" | chpasswd \
    && echo 'chyld  ALL=(ALL:ALL) ALL' >> /etc/sudoers

USER chyld
WORKDIR /home/chyld

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

RUN wget https://nodejs.org/dist/v20.5.0/node-v20.5.0-linux-x64.tar.xz \
    && tar -xf node-v20.5.0-linux-x64.tar.xz   \
    && mkdir -p ~/.local                       \
    && mv node-v20.5.0-linux-x64 ~/.local/node \
    && rm node*.tar.xz

RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /home/chyld/.local/miniconda3 \
    && rm Miniconda3-latest-Linux-x86_64.sh

RUN mkdir X Code .config && cd Code && git clone --depth 1 https://github.com/chyld/devops

RUN rm .bash_profile .bashrc \ 
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.bash_profile . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.bashrc . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.gitconfig . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/.tmux.conf . \
    && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/starship.toml ~/.config

SHELL ["/bin/bash", "--login", "-c"]

RUN npm install -g eslint zx tldr @angular/cli

RUN conda create -y --name frodo python=3.11 -c conda-forge \
    && conda activate frodo \
    && conda install -y jupyterlab -c conda-forge \
    && pip install frogmouth ruff pytest black httpie pandas numpy matplotlib seaborn scikit-learn scipy sympy statsmodels \
    && pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

RUN cargo install tuc --features regex \
    && cargo install atuin \
    && cargo install erdtree \
    && cargo install ast-grep \
    && curl https://raw.githubusercontent.com/rcaloras/bash-preexec/master/bash-preexec.sh -o ~/.bash-preexec.sh

# RUN wget https://download.visualstudio.microsoft.com/download/pr/ebfd0bf8-79bd-480a-9e81-0b217463738d/9adc6bf0614ce02670101e278a2d8555/dotnet-sdk-7.0.203-linux-x64.tar.gz \
#    && mkdir -p $HOME/dotnet && tar zxf dotnet-sdk-7.0.203-linux-x64.tar.gz -C $HOME/dotnet \
#    && rm dotnet-sdk-7.0.203-linux-x64.tar.gz

RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm \
    && ~/.tmux/plugins/tpm/bin/install_plugins

RUN git clone https://github.com/LazyVim/starter ~/.config/nvim

# RUN git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim \
#   && nvim --headless -c 'autocmd User PackerComplete quitall' \
#   && nvim --headless -c "TSInstallSync python javascript typescript lua bash" +qa \
#   && nvim --headless -c 'MasonInstall dockerfile-language-server bash-language-server lua-language-server typescript-language-server pyright prettier quick-lint-js pylint black shellcheck' +qa

# RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim \
#   && ln -s ~/Code/devops/platforms/mint-ubuntu/v012/nvim ~/.config \
#   && nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' \
#   && nvim --headless -c 'MasonInstall dockerfile-language-server bash-language-server lua-language-server typescript-language-server pyright prettier quick-lint-js pylint black shellcheck' +qa

#
# #
# # #
