source ~/.bashrc
source ~/.profile

LOCAL=$HOME/.local
GIT_PATH=$LOCAL/git/bin
CONDA_PATH=$LOCAL/conda/bin

export PATH=$GIT_PATH:$CONDA_PATH:$PATH

export NVM_DIR="/home/chyld/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
