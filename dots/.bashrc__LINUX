BIN_HOME="$HOME/.bin"
ALPHA_EXPORTS="$HOME/Distroboxes/alpha/.bin/exports"

export PATH=$BIN_HOME:$BIN_HOME/links:$BIN_HOME/node/bin:$BIN_HOME/exports:$BIN_HOME/distrobox/bin:$ALPHA_EXPORTS:$PATH
export GCM_CREDENTIAL_STORE=secretservice
IS_LOADED=1 # this is used for tmux, if this variable is not present, then source this file

alias c="clear"
alias b="cd .."
alias g="git"
alias vi="nvim"
alias cat="bat"
alias find="fd"
alias grep="rg"
alias y="yazi"

alias gs="git status --short"
alias gd="git diff"
alias gl="git log --oneline"

alias bin="cd $HOME/.bin"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias dots="cd $HOME/Developer/devops/dots"

alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first"
alias cl="c && l"
alias cll="c && ll"

alias alpha="distrobox enter alpha"
alias omega="distrobox enter omega"
alias hacker="docker run -t --rm rust-stakeholder" # https://github.com/giacomo-b/rust-stakeholder
alias matrix="unimatrix.py -af -c cyan -l mp"      # https://github.com/will8211/unimatrix; clone to get fonts

cursor() (
  # this function is running in a subshell, notice the parens - not braces
  # it disables job control, which means the PID from cursor starting, will not be displayed
  # the "echo" will be displayed as normal
  directory="$1"

  if [ -z "$directory" ]; then
    echo "directory variable is empty"
    exit 1
  fi

  cursor.appimage --no-sandbox "$directory" 1>cursor.log 2>cursor.err &
)

path() {
  echo "$PATH" | path.py
}

eb() {
  vi $HOME/.bashrc
}

eval "$(starship init bash)"
