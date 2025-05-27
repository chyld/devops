BIN_HOME="$HOME/.bin"
export PATH=$BIN_HOME:$BIN_HOME/node/bin:$PATH

alias c="clear"
alias b="cd .."
alias d="docker"
alias vi="nvim"
alias cat="bat"
alias g="git"

alias bin="cd $BIN_HOME"
alias dev="cd $HOME/Developer"
alias dl="cd $HOME/Downloads"
alias dots="cd $HOME/Developer/devops/dots"
alias docs="cd $HOME/Documents"

alias gs="git status"
alias gl="git log --oneline"
alias gd="git diff"

alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first"
alias cl="c && l"
alias cll="c && ll"

path() {
  echo $PATH | tr ":" "\n"
}

ez() {
  vi $HOME/.zshrc
}

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(starship init zsh)"

