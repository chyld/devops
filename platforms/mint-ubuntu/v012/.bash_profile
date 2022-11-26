#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

scriptsbin=$HOME/Code/devops/scripts
nodebin=$HOME/.local/node/bin
export PATH=$scriptsbin:$nodebin:$PATH

alias c="clear"
alias b="cd .."
alias l="exa --icons --git -aF"
alias ll="exa --icons --git -laF"
alias cl="c && l"
alias cll="c && ll"
