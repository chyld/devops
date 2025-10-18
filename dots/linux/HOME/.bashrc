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
alias fm="dolphin . &" # file manager (fm)
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
alias prj="cd $HOME/Projects"
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
xce() {
  local project_dir=$(x_create_directory.py EMPTY)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  ll
}

xcg() {
  local project_dir=$(x_create_directory.py GIT)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  touch README.md
  git init
  git add .
  git commit -m "Repository initialized"
  ll
}

xcp() {
  local project_dir=$(x_create_directory.py PYTHON)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  uv init
  uv run main.py
  git add .
  git commit -m "Repository initialized"
  cat pyproject.toml
  ll
}

xcv() {
  local project_dir=$(x_create_directory.py VITE)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  npm create vite@latest . -- --no-interactive
  npm i
  git init
  git add .
  git commit -m "Repository initialized"
  cat package.json
  ll
}

xcb() {
  local project_dir=$(x_create_directory.py BTS)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  bun create better-t-stack@latest . --yes
  ll
}

xpp() {
  rm -rf ~/Projects/*
  cd ~/Projects
  ll
}

help() {
  glow -w 0 "$HOME/.local/bin/scripts/README.md"
}
alias h=help

edit_help() {
  vi "$HOME/.local/bin/scripts/README.md"
}
alias eh=edit_help

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

# opencode
export PATH=/home/chyld/.opencode/bin:$PATH
