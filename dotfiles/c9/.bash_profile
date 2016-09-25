source ~/.bashrc
source ~/.profile

LOCAL=$HOME/.local
GIT_PATH=$LOCAL/git/bin
CONDA_PATH=$LOCAL/conda/bin
WHISK_PATH=$LOCAL/openwhisk-python-cli/tools/cli

export PATH=$GIT_PATH:$CONDA_PATH:$WHISK_PATH:$PATH
