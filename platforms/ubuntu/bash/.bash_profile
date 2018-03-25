source ~/.bashrc

DOTS=$HOME/Code/bash

source $DOTS/.bash_env_vars
source $DOTS/.bash_functions
source $DOTS/.bash_colors
source $DOTS/.bash_aliases

export PS1="$deepskyblue[\w] $gold\$(branch)$deeppink\$(status)$greenyellow:$reset "
