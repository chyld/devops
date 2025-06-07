# .bashrc
#
# this file runs every time you open a new terminal or window or pane
# it defines the aliases and functions available in the terminal session
# ------------------------------------------------------------------------ #

# journalctl -b0 | grep chyld
logger -t "chyld-debug" "$(date '+%Y:%m:%d:%H:%M:%S') - .bashrc"

alias c="clear"
alias b="cd .."
alias g="git"
alias d="docker"
alias vi="nvim"
alias cat="bat"
alias y="yazi"

alias gs="git status --short"
alias gd="git diff"
alias gl="git log --oneline"

alias bin="cd $HOME/.bin"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias dots="cd $HOME/Developer/devops/dots/linux"
alias conf="cd $HOME/.config"

alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first --git --git-repos"
alias lll="eza -alT --icons -L 1 --git-repos --no-permissions --no-user --no-time"
alias llll="tree -Ca -L 3"
alias cl="c && l"
alias cll="c && ll"
alias clll="c && lll"
alias cllll="c && llll"

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
