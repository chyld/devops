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
alias fm="(dolphin . &)" # file manager (fm), runs in a sub-process, so you do not see the pid when stop and start
# ---------------------------------------------------------------------------------------------------------- #
alias gs="git status --short"
alias gd="git diff"
alias gds="git diff --stat"
alias gl="git log --oneline --graph --decorate"
alias gwl="git worktree list"

gac() {
  # git add commit
  git add .
  git commit -am "automated commit"
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
p() {
  # "p" for "project"
  CHOICE=$(gum choose \
    "1. Empty" \
    "2. Empty with Git" \
    "3. UV" \
    "4. Vite" \
    "5. Better T Stack" \
    "6. Bun" \
    "7. Next.js" \
    "8. PURGE")

  NUM=$(echo $CHOICE | awk '{print $1}' | tr -d '.')

  case $NUM in
  1) p_empty ;;
  2) p_empty_with_git ;;
  3) p_uv ;;
  4) p_vite ;;
  5) p_better_t_stack ;;
  6) p_bun ;;
  7) p_next_js ;;
  8) p_purge ;;
  esac
}

pp() {
  cd $HOME/Projects
  ll
}

p_empty() {
  local project_dir=$(x_create_directory.py EMPTY)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  ll
}

p_empty_with_git() {
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

p_uv() {
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

p_vite() {
  local project_dir=$(x_create_directory.py VITE)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  npm create vite@latest
}

p_better_t_stack() {
  local project_dir=$(x_create_directory.py BTS)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  bun create better-t-stack@latest
}

p_bun() {
  local project_dir=$(x_create_directory.py BUN)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  bun init
}

p_next_js() {
  local project_dir=$(x_create_directory.py NEXT)
  local full_dir="$HOME/Projects/$project_dir"
  mkdir -p "$full_dir"
  cd "$full_dir"
  npx create-next-app@latest
}

p_purge() {
  rm -rf ~/Projects/*
  cd ~/Projects
  ll
}

x____________________() {
  local project=$(basename "$(pwd)")
  local result=$(bun ~/.local/bin/scripts/is_project.js)
  if [[ "$result" == "1" ]]; then
    mv "$HOME/Projects/$project" "$HOME/Developer"
    cd "$HOME/Developer/$project"
    pwd
    ll
    echo "Project $project has been SAVED to Developer"
  fi
}
# ---------------------------------------------------------------------------------------------------------- #
t() {
  cd "$(mktemp -d --tmpdir="$HOME/Temp")"
}

tt() {
  cd $HOME/Temp
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
