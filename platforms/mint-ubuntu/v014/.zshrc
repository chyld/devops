# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #

BIN_PATH=$HOME/.bin
NODE_PATH=$HOME/.bin/node/bin
CODE_PATH=$HOME/.bin/vscode/bin
SCRIPTS_PATH=$HOME/Code/devops/scripts
export PATH=$NODE_PATH:$CODE_PATH:$SCRIPTS_PATH:$PATH
export FZF_DEFAULT_COMMAND=''

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #

alias dev="cd ~/Code/devops"
alias dots="cd ~/Code/devops/platforms/mint-ubuntu/v014"
alias bin="cd ~/.bin"
alias dl="cd ~/Downloads"
alias b="cd .."

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #

alias eb="vi ~/.bash_custom" # edit bash
alias c="clear"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias g="git"
alias gs="git status"
alias gd="git diff"
alias jl="jupyter lab"
alias backlight="cat /sys/class/leds/smc::kbd_backlight/brightness"
alias fonts="fc-list : family | sort | uniq | nl"
alias system="inxi -F"
alias mountnfs="sudo mount -t nfs 192.168.1.10:/mnt/datastore/hydrogen /home/chyld/Share"
alias umountnfs="sudo umount /home/chyld/Share"

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #

# exa, eza, lsd

alias     l="lsd -A   --group-directories-first"
alias    ll="eza -la --icons=always --group-directories-first --git-repos --git"
alias   lll="eza -la --icons=always --group-directories-first --git-repos --git --total-size"
alias  llll="lsd -Alg --group-directories-first --tree --blocks size,git,name --ignore-glob .git --ignore-glob __pycache__ --ignore-glob node_modules"
alias    cl="c;l"
alias   cll="c;ll"
alias  clll="c;lll"
alias cllll="c;llll"

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #

eval "$(atuin init zsh)"

# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #
# ---------------------------------------------------------------------- #

