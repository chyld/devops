# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

alias b="cd .."
alias c="clear"
alias ls="lsd -A --group-dirs first"
alias l="lsd -Al --group-dirs first --blocks permission,user,size,name"
alias t="tree -a -I .git"
alias cat='bat'  # use \cat to overridde
alias meow='/bin/cat'
alias tmux='tmux -2'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias nuke="ls -A1 | xargs -d '\n' rm -rf" # change the delimiter to newline, not space
alias vi='nvim.appimage'
alias df='duf'
alias o='xdg-open'
alias g="git"
alias gl='git log --oneline'
alias gs='git status'
alias gd="git diff"
alias ga="git add --interactive"
alias d='docker'
alias dc='docker-compose'
alias dp='docker system prune -a'
alias k='kubectl'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias m='make'

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# monitor: change file events
monitor() {
  inotifywait -e delete,create,modify -m -r "$1"
}

# monitor all: read and write file events
monitor+() {
  inotifywait -e access,delete,create,modify -m -r "$1"
}

jl() {
  if [ $# -eq 0 ]; then
    port=$(port.py)
  else
    port=$1
  fi
  jupyter lab --ip=0.0.0.0 --port=$port --LabApp.token='' 1>> stdout.log 2>> stderr.log & disown
}

jn() {
  jupyter notebook --no-browser --ip=0.0.0.0 --port="$1" --NotebookApp.token=''
}

jc() {
  jupyter console
}

path() {
  echo $PATH | tr ":" "\n" | nl
}

play() {
  destination=$(play.py $1 $2)
  retval=$?
  cd $destination
  if [ $retval -eq 2 ]; then
    git init
    git add .
    git commit -m "first"
  fi
  clear
  l
}

alias p="play"

rename() {
  destination=$(rename.py $1)
  retval=$?
  if [ $retval -eq 0 ]; then
    cd $destination
  fi
  clear
  l
}

alias r="rename"

help() {
  clear
  cd ~/Code/devops/docs
  glow readme.md
  l
}

alias h="help"

kj() {
  pkill -i -f jupyter-lab
}

fj() {
  pgrep -ia -f jupyter-lab
}

cl() {
  clear
  l
}

cls() {
  clear
  ls
}

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

export EDITOR="code"
export PYTHONDONTWRITEBYTECODE=1

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

LOCAL_BIN=$HOME/.local/bin
NODE_BIN=$HOME/.local/node/bin
DATAGRIP_BIN=$HOME/.local/datagrip/bin
SCRIPTS_BIN=$HOME/Code/devops/scripts
export PATH=$LOCAL_BIN:$NODE_BIN:$DATAGRIP_BIN:$SCRIPTS_BIN:$PATH

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chyld/.local/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chyld/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chyld/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chyld/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate alpha

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='fd --type f --type l --hidden --exclude .git'

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

source ~/.local/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.local/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.local/zsh/z.lua/z.lua.plugin.zsh

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

