BIN_HOME="$HOME/.bin"

export PATH=$BIN_HOME:$BIN_HOME/node/bin:$BIN_HOME/exports:$BIN_HOME/distrobox/bin:$BIN_HOME/scripts:$PATH
export GCM_CREDENTIAL_STORE=secretservice

alias c="clear"
alias b="cd .."
alias g="git"
alias d="docker"
alias vi="nvim"
alias cat="bat"

alias gs="git status --short"
alias gd="git diff"
alias gl="git log --oneline"

alias bin="cd $HOME/.bin"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias dots="cd $HOME/Developer/devops/dots/linux"
alias conf="cd $HOME/.config"

alias l="eza -a --icons --group-directories-first"
alias ll="eza -alT --icons -L 1 --git-repos --no-permissions --no-user --no-time"
alias lll="eza -al --icons --group-directories-first --git --git-repos"
alias cl="c && l"
alias cll="c && ll"
alias clll="c && lll"

alias alpha="distrobox enter alpha"
alias xc="x_create.py"
alias cur="$BIN_HOME/cursor/AppRun --no-sandbox ."

path() {
  echo "$PATH" | tr ":" "\n"
}

eb() {
  vi $HOME/.bashrc
}

eval "$(starship init bash)"
