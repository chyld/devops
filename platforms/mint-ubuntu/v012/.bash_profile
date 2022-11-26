#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

scriptsbin=$HOME/Code/devops/scripts
nodebin=$HOME/.local/node/bin
export PATH=$scriptsbin:$nodebin:$PATH
