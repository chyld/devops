# Created by newuser for 5.9

# ------------------------------------------------------------------------------------------------ #

HISTFILE=~/.histfile
HISTSIZE=99000       # history in memory
SAVEHIST=99000       # history in file

# ------------------------------------------------------------------------------------------------ #

# Share command history across all running Zsh sessions
setopt share_history

# Change directories by simply typing the directory name, no need to use `cd`
setopt autocd

# Enable the terminal bell (or beep) for errors
setopt beep

# Enable extended pattern matching features in globbing
setopt extendedglob

# Raise an error if a glob pattern does not match any files
setopt nomatch

# Notify immediately when a background job completes
setopt notify

# Allow comments in interactive shell sessions
setopt interactive_comments

# ------------------------------------------------------------------------------------------------ #

NODE=$HOME/.bin/node/bin
POSH=$HOME/.bin/posh/bin
JAVA=$HOME/.bin/java/bin
MINECRAFT=$HOME/.bin/minecraft
SCRIPTS=$HOME/Code/devops/scripts
export PATH=$NODE:$POSH:$JAVA:$MINECRAFT:$SCRIPTS:$PATH
export EDITOR=nvim

# ------------------------------------------------------------------------------------------------ #
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chyld/.bin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chyld/.bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chyld/.bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chyld/.bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
# ------------------------------------------------------------------------------------------------ #

conda activate prometheus
source $HOME/.zshrc_aliases
source $HOME/.zshrc_functions
source $HOME/.fzf.zsh
eval "$(oh-my-posh init zsh)"

# ------------------------------------------------------------------------------------------------ #

