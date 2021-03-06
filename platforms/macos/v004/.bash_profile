### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

source ~/.bash_colors

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

alias l='exa -lFa --git'
alias h='history'
alias c='clear'
alias b='cd ..'
alias d='docker'
alias g='git'
alias cat='bat'
alias jc="jupyter console"
alias jq='jupyter qtconsole --style monokai &'
alias jn="jupyter notebook"
alias jl="jupyter lab"
alias tb="nc termbin.com 9999"
# fd, rg, tree, htop, wget, ag (the_silver_searcher)

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

APPS=/Users/chyld/.local/apps
export PATH=$APPS/node/bin:$PATH

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

GIT_PROMPT_ONLY_IN_REPO=0
GIT_PROMPT_SHOW_UPSTREAM=1
GIT_PROMPT_SHOW_UNTRACKED_FILES=normal
GIT_PROMPT_START="$e3 $c0\u$c3+$c0\h $u$c4\w$r"
GIT_PROMPT_END="\n$ca:>$r "
. $APPS/bash-git-prompt/gitprompt.sh

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

eval "$(lua /Users/chyld/.local/apps/z.lua/z.lua --init bash enhanced once fzf)"

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

. "/Users/chyld/.local/apps/miniconda3/etc/profile.d/conda.sh"
conda activate py37

### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###
### ------------------------------------------------------------------------------------- ###

