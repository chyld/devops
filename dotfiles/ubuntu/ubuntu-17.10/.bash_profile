### ------------------------------------------------------------------ ###
source ~/.bashrc
source ~/.bash_aliases
source ~/.bash_colors
### ------------------------------------------------------------------ ###

LOCAL=$HOME/.local

CONDA_PATH=$LOCAL/miniconda3/bin
NODE_PATH=$LOCAL/node/bin
GO_PATH=$LOCAL/go/bin

export PYTHONDONTWRITEBYTECODE=1 # suppress __pycache__
export HISTSIZE=100000
export EDITOR=vim
export GOPATH=/vagrant/go
export PATH=$CONDA_PATH:$NODE_PATH:$GO_PATH:$PATH
export PS1="$fuchsia[\w] $aqua:$reset "

