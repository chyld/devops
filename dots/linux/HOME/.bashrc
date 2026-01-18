# ---------------------------------------------------------------------------------------------------------- #
# .bashrc
#
# this file runs every time you open a new terminal or window or pane
# it defines the aliases and functions available in the terminal session
# ---------------------------------------------------------------------------------------------------------- #
logger -t "chyld-debug" "$(date '+%Y:%m:%d:%H:%M:%S') - .bashrc"
local_bin=$HOME/.local/bin
temp_path=$local_bin:$HOME/.opencode/bin:$local_bin/node/bin:$local_bin/scripts:$PATH # opencode binary is in 2 different locations
export PATH=$(echo "$temp_path" | tr ':' '\n' | awk '!a[$1]++' | paste -sd:)          # this will remove duplicate items
# ---------------------------------------------------------------------------------------------------------- #
# BASICS
alias c="clear"
alias b="cd .."
alias g="git"
alias d="docker"
alias vi="nvim"
alias cat="bat"
alias y="yazi"
alias df="duf"
alias fd="fd --unrestricted"
alias fm="(dolphin . &)" # file manager (fm), runs in a sub-process, so you do not see the pid when stop and start
alias yt0="uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp"
alias yt1="uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp --hls-use-mpegts --retries infinite --fragment-retries 50"
alias yt2="uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp --hls-use-mpegts --retries infinite --fragment-retries 50 --remote-components ejs:github"
alias ffp="ffprobe -hide_banner"
# ---------------------------------------------------------------------------------------------------------- #
# GIT
alias gs="git status --short --untracked-files=all"
alias gd="git diff"
alias gds="git diff --stat"
alias gl="git log --oneline --graph --decorate"
alias gwl="git worktree list"

gac() {
  # git add commit
  if [[ -z "$1" ]]; then
    echo "Error: commit message required"
    echo "Usage: gac \"your commit message\""
    return 1
  fi
  git add .
  git commit -m "$1"
}

gr() {
  # git reset
  git reset --hard HEAD
  git clean -fd
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
# TELEPORT
alias v="cd $HOME/Void"
alias bin="cd $HOME/.local/bin"
alias dl="cd $HOME/Downloads"
alias dv="cd $HOME/Developer"
alias prj="cd $HOME/Projects"
alias dots="cd $HOME/Developer/devops"
alias config="cd $HOME/.config"
# ---------------------------------------------------------------------------------------------------------- #
# DIR LISTS
alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first --git --git-repos"
alias lll="eza -alT --icons -L 1 --no-permissions --no-user --no-time"
alias llll="tree -Ca -L 3"
alias cl="c && l"
alias cll="c && ll"
alias clll="c && lll"
alias cllll="c && llll"
# ---------------------------------------------------------------------------------------------------------- #
# DEVELOPER
dev() {
  clear
  lll ~/Developer
  lll ~/Projects
  lll ~/Temp
  lll ~/Void
}

dev_delete_all() {
  cd ~
  rm -rf Projects/*
  rm -rf Temp/*
  rm -rf Void/*
  dev
}
# ---------------------------------------------------------------------------------------------------------- #
# PROJECT TEMPLATES
p() {
  # "p" for "project"
  CHOICE=$(gum choose \
    "1. Empty" \
    "2. Empty with Git" \
    "3. UV" \
    "4. Vite" \
    "5. Better T Stack" \
    "6. Bun" \
    "7. Next.js")

  NUM=$(echo $CHOICE | awk '{print $1}' | tr -d '.')

  case $NUM in
  1) p_empty ;;
  2) p_empty_with_git ;;
  3) p_uv ;;
  4) p_vite ;;
  5) p_better_t_stack ;;
  6) p_bun ;;
  7) p_next_js ;;
  esac
}

pp() {
  cd $HOME/Projects
  ll
}

pppp() {
  rm -rf ~/Projects/*
  cd ~/Projects
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
# ---------------------------------------------------------------------------------------------------------- #
# TEMPORARY FILES
t() {
  cd "$(mktemp -d --tmpdir="$HOME/Temp")"
}

tt() {
  cd $HOME/Temp
  ll
}

tttt() {
  rm -rf ~/Temp/*
  cd ~/Temp
  ll
}
# ---------------------------------------------------------------------------------------------------------- #
# RUNNING DOCKER
docker_build_and_run_deb13() {
  cd ~/Developer/devops/containers/debian_13
  ./build.sh
  ./run.sh
}

docker_run_deb13() {
  cd ~/Developer/devops/containers/debian_13
  ./run.sh
}

docker_rm_all_containers() {
  docker rm -f $(docker ps -aq)
}

docker_ls() {
  docker images
  docker ps -a
}
# ---------------------------------------------------------------------------------------------------------- #
# DOCUMENTATION
help() {
  xdg-open "$HOME/.local/bin/scripts/docs/help.html" 1> /dev/null 2> /dev/null
}
alias h=help
# ---------------------------------------------------------------------------------------------------------- #
# UTILITIES
log() {
  journalctl -b | rg "chyld-debug" | nl
}

path() {
  echo "$PATH" | tr ":" "\n"
}

eb() {
  vi $HOME/.bashrc
}

monitor_directory() {
  inotifywait -m -r -e create,modify,delete,move "$1" | rg -vi "google-chrome|docker|nvim|git"
}
# ---------------------------------------------------------------------------------------------------------- #
hytale_server() {
  ~/.local/share/Hytale/install/release/package/jre/latest/bin/java \
	  -jar /home/chyld/.local/share/Hytale/install/release/package/game/latest/Server/HytaleServer.jar \
	  --assets=/home/chyld/.local/share/Hytale/install/release/package/game/latest/Assets.zip \
	  --mods=/home/chyld/.local/share/Hytale/UserData/Mods \
	  --bind 0.0.0.0
}
# ---------------------------------------------------------------------------------------------------------- #
source /usr/share/nvm/init-nvm.sh
eval "$(starship init bash)"
# ---------------------------------------------------------------------------------------------------------- #
