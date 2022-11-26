#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

scriptsbin=$HOME/Code/devops/scripts
nodebin=$HOME/.local/node/bin
export PATH=$scriptsbin:$nodebin:$PATH

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

alias c="clear"
alias b="cd .."
alias l="exa --icons --git -aF"
alias ll="exa --icons --git -laF"
alias cl="c && l"
alias cll="c && ll"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

alias g="git"
alias gs="git status"
alias grh="git reset HEAD --hard && git clean -fd"
alias gl="git log --oneline --color --graph"
alias gsa="git stash --all"
alias gsl="git stash list"
alias gsc="git stash clear"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chyld/.local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
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

alias ca="conda activate"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
