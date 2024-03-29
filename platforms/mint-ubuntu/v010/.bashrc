# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

SCRIPTS_BIN=$HOME/Code/devops/scripts
LOCAL_BIN=$HOME/.local/bin
NODE_BIN=$HOME/.local/node/bin
NVIM_BIN=$HOME/.local/nvim
export PATH=$PATH:$SCRIPTS_BIN:$NODE_BIN:$NVIM_BIN:$LOCAL_BIN

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# xc, xw, x, xl, xll

xc() {
  destination=$(x-dir.py)
  cd $destination
  touch README.md
  git init
  git add README.md
  git commit -m "Auto generated from xc"
}

xw() {
    num="${1:-1}" # set num to $1 if exists, else set to 1 (default)
    cd $HOME/X
    lastdir=$(exa -1 --sort created | tail -n $num | head -n 1)
    cd $lastdir
    clear
}

alias x="cd $HOME/X"
alias xl="x && exa -RTla --icons --level 1 --sort created -b"
alias xll="x && exa -RTla --icons --level 2 --sort created -b --no-permissions --no-time --no-user"

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# view any env variable in any process

view_env_variables_by_process() {
    cat /proc/"$1"/environ | tr '\0' '\n'
}

# usage, monitor ., or monitor /usr
# this will watch read, write, modify, delete file access - recursively
# a wonderful debugging tool to see what files are being used by a process

monitor() {
  inotifywait -e access,delete,create,modify -m -r "$1"
}

# make the path look nice

path() {
    # prefix the script with tabs, not spaces
    # notice the (pipe) on the next line, this allows the output of the lua program to be piped to nl
	lua <<- EOF |
		s = string.gsub("$PATH", ":", "\n")
		print(s)
	EOF
    nl
}

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# notice the () not {} around the body of this function
# this will run this function in a subshell
# and not pollute the current env with LD_LIBRARY_PATH which can cause problems
# this env variable is required to use tensorflow gpu

jltf() (
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
    jl "$1"
)

# jl 3333 (to start jupyter lab on port 3333)
# jupyter lab list (to view all running instances)
# File -> ShutDown (to exit, from GUI)

jl() {
    port="$1"
    port_len=$(echo "const s = '$port'; console.log(s.length);" | node)

    # the python script has to be prefixed with tabs (not spaces) or it will not work
    if [ $port_len -eq 0 ]; then
		port=$(python <<- EOF
			from scipy.stats import randint
			n = randint(2_000, 10_000).rvs()
			print(n)
		EOF
		)
    fi

    echo "Starting jupyter lab on port $port. Use jll to see a list of running servers."
    nohup jupyter lab --no-browser --ip="0.0.0.0" --port="$port" --ServerApp.token="" 1> "$port"-a.log 2> "$port"-b.log &
}

# kill all instances of jupyter lab

jlkill() {
    ps -ux | rg -v rg | rg jupyter-lab | tuc -e '\s+' -f 2 | xargs -I @@ kill -s SIGKILL @@
}

alias jll="jupyter lab list"

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

alias g="git"
alias gs="git status"
alias grh="git reset HEAD --hard && git clean -fd"
alias gl="git log --oneline --color --graph"
alias gsa="git stash --all"
alias gsl="git stash list"
alias gsc="git stash clear"

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

alias c="clear"
alias b="cd .."
alias rcp="find -name .ipynb_checkpoints | xargs -I @@ rm -rf @@"
alias d="docker"
alias cat="bat"
alias cut="tuc"
alias t="tree -a -I .git"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vi="nvim.appimage"
alias dots="cd /home/chyld/Code/devops/platforms/mint-ubuntu/v010"

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

alias l="exa --icons --git -a"
alias ll="exa --icons --git -la"
alias cl="c && l"
alias cll="c && ll"

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chyld/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chyld/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chyld/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chyld/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda activate alpha

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

eval "$(starship init bash)"

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

