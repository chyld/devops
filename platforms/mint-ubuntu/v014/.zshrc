# --------------------------------------------------------------------------------------------- #

HISTFILE=~/.histfile
HISTSIZE=99000       # history in memory
SAVEHIST=99000       # history in file
setopt share_history autocd beep extendedglob nomatch notify interactive_comments
bindkey -v           # setup VI keybindings
zstyle :compinstall filename '/home/chyld/.zshrc'
autoload -Uz compinit
compinit

# --------------------------------------------------------------------------------------------- #

source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------------------------------------------------------------------------------------------- #

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

# --------------------------------------------------------------------------------------------- #

BIN_PATH=$HOME/.bin
NODE_PATH=$HOME/.bin/node/bin
CODE_PATH=$HOME/.bin/vscode/bin
SCRIPTS_PATH=$HOME/Code/devops/scripts
export PATH=$NODE_PATH:$CODE_PATH:$SCRIPTS_PATH:$PATH
export FZF_DEFAULT_COMMAND=''
export EDITOR=nvim

# --------------------------------------------------------------------------------------------- #

source $HOME/.zshrc_aliases
source $HOME/.zshrc_functions

# --------------------------------------------------------------------------------------------- #

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
conda activate prometheus
eval "$(starship init zsh)"

# --------------------------------------------------------------------------------------------- #

