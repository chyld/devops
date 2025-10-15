# ---------------------------------------------------------------------------------------------------------- #
# .bashrc
#
# this file runs every time you open a new terminal or window or pane
# it defines the aliases and functions available in the terminal session
# ---------------------------------------------------------------------------------------------------------- #
logger -t "chyld-debug" "$(date '+%Y:%m:%d:%H:%M:%S') - .bashrc"
local_bin=$HOME/.local/bin
temp_path=$local_bin:$local_bin/node/bin:$local_bin/scripts:$PATH
export PATH=$(echo "$temp_path" | tr ':' '\n' | awk '!a[$1]++' | paste -sd:) # this will remove duplicate items
# ---------------------------------------------------------------------------------------------------------- #
alias c="clear"
alias b="cd .."
alias g="git"
alias d="docker"
alias vi="nvim"
alias cat="bat"
alias y="yazi"
alias df="duf"
# ---------------------------------------------------------------------------------------------------------- #
alias gs="git status --short"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate"
alias gwl="git worktree list"

gc() {
  # git commit (quick)
  git add .
  git commit -am "quick commit"
}

gwa() {
  # git worktree add
  if [ -z "$1" ]; then
    echo "Error: Name is required."
    return 1
  fi

  local name="$1"
  local dironly=$(basename $(pwd))
  git worktree add "../TREE-$dironly-$name" -b "$name"
  git worktree list
}
# ---------------------------------------------------------------------------------------------------------- #
alias bin="cd $HOME/.local/bin"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias dots="cd $HOME/Developer/devops/dots/linux"
alias config="cd $HOME/.config"
# ---------------------------------------------------------------------------------------------------------- #
alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first --git --git-repos"
alias lll="eza -alT --icons -L 1 --git-repos --no-permissions --no-user --no-time"
alias llll="tree -Ca -L 3"
alias cl="c && l"
alias cll="c && ll"
alias clll="c && lll"
alias cllll="c && llll"
# ---------------------------------------------------------------------------------------------------------- #
alias xcb="x_create_blank.py"
alias xcg="x_create_generic.py"
alias xcp="x_create_python.py"

help() {
  glow "$HOME/.local/bin/scripts/README.md"
}
alias h=help

log() {
  journalctl -b | rg "chyld-debug" | nl
}

path() {
  echo "$PATH" | tr ":" "\n"
}

eb() {
  vi $HOME/.bashrc
}
# ---------------------------------------------------------------------------------------------------------- #
eval "$(starship init bash)"
# ---------------------------------------------------------------------------------------------------------- #
