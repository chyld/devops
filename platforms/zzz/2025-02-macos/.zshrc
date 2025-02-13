alias c="clear"
alias b="cd .."
alias vi="nvim"
alias cat="bat"
alias g="git"
alias gs="git status"
alias gl="git log --oneline"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first"
alias cl="c && l"
alias cll="c && ll"

export NVM_DIR="$HOME/.nvm"

. "$NVM_DIR/nvm.sh"
. "$HOME/.local/bin/env"

