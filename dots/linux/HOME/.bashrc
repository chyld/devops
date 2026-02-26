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
# ---------------------------------------------------------------------------------------------------------- #
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
alias yt3="uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp --hls-use-mpegts --retries infinite --fragment-retries 50 --remote-components ejs:github --cookies-from-browser chrome"
alias ffp="ffprobe -hide_banner"
# ---------------------------------------------------------------------------------------------------------- #
# TELEPORT
# ---------------------------------------------------------------------------------------------------------- #
alias bin="cd $HOME/.local/bin"
alias dl="cd $HOME/Downloads"
alias dv="cd $HOME/Developer"
alias dots="cd $HOME/Developer/devops"
alias config="cd $HOME/.config"
# ---------------------------------------------------------------------------------------------------------- #
# DIR LISTS
# ---------------------------------------------------------------------------------------------------------- #
alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first --git --git-repos"
alias lll="eza -alT --icons -L 1 --no-permissions --no-user --no-time"
alias llll="tree -Ca -L 3"
alias cl="c && l"
alias cll="c && ll"
alias clll="c && lll"
alias cllll="c && llll"
# ---------------------------------------------------------------------------------------------------------- #
# GIT
# ---------------------------------------------------------------------------------------------------------- #
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
# TEMP
# ---------------------------------------------------------------------------------------------------------- #
t() {
  local rnd=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c3)
  local dir="$HOME/Temp/$(date +%m%d.%H-%M).$rnd"
  mkdir -p "$dir" && cd "$dir"
}

tl() {
  # temp list
  cd ~/Temp
  ll
}

tg() {
  # temp + git
  t
  touch README.md
  git init
  git add .
  git commit -am "first commit"
}

# below are "t-apps"

tab() {
  # temp app with bun
  t
  bun init
}

tav() {
  # temp app with vite
  t
  npm create vite@latest
}

tau() {
  # temp app with uv
  t
  uv init
}

tan() {
  # temp app with nextjs
  t
  npx create-next-app@latest
}

tat() {
  # temp app with t-stack (better)
  t
  bun create better-t-stack@latest
}
# ---------------------------------------------------------------------------------------------------------- #
# UTILITIES
# ---------------------------------------------------------------------------------------------------------- #
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
# HYTALE
# ---------------------------------------------------------------------------------------------------------- #
hytale_server() {
  ~/.local/share/Hytale/install/release/package/jre/latest/bin/java \
	  -jar /home/chyld/.local/share/Hytale/install/release/package/game/latest/Server/HytaleServer.jar \
	  --assets=/home/chyld/.local/share/Hytale/install/release/package/game/latest/Assets.zip \
	  --mods=/home/chyld/.local/share/Hytale/UserData/Mods \
	  --bind 0.0.0.0
}
alias hs=hytale_server
# ---------------------------------------------------------------------------------------------------------- #
# FINAL
# ---------------------------------------------------------------------------------------------------------- #
source /usr/share/nvm/init-nvm.sh
eval "$(starship init bash)"
# ---------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------------------------------------- #
