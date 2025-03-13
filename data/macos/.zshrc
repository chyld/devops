# ALIASES
#-------------------------------------------------
alias cur="open $1 -a \"Cursor\""
alias c="clear"
alias b="cd .."
alias vi="nvim"
alias cat="bat"
alias g="git"
alias gs="git status"
alias gl="git log --oneline"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias dots="cd $HOME/Developer/devops/data/macos"
alias devops="cd $HOME/Developer/devops"
alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first"
alias cl="c && l"
alias cll="c && ll"

# ENV VARIABLES
#-------------------------------------------------
export NVM_DIR="$HOME/.nvm"

# FUNCTIONS
#-------------------------------------------------
path() {
  echo $PATH | tr ':' '\n' | nl
}

ez() {
  vi $HOME/.zshrc
}

# SOURCE
#-------------------------------------------------
. "$NVM_DIR/nvm.sh"
. "$HOME/.local/bin/env"

# PROMPT
#-------------------------------------------------
eval "$(starship init zsh)"

