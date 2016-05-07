source ~/.bashrc
source ~/.profile

LOCAL=$HOME/.local
NODE_PATH=$LOCAL/node/bin
GIT_PATH=$LOCAL/git/bin
CONDA_PATH=$LOCAL/conda/bin

export PATH=$NODE_PATH:$GIT_PATH:$CONDA_PATH:$PATH
