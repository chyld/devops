source ~/.bash_colors

alias l='exa -lFa --git'
alias h='history'
alias c='clear'
alias b='cd ..'
alias g='git'
alias cat='bat'
alias jc="jupyter console"
alias jq='jupyter qtconsole --style monokai &'
alias jn="jupyter notebook"
alias jl="jupyter lab"

alias jl0='jupyter lab --no-browser --port=3000 --ip=0.0.0.0 2> lab0.txt 1>&2 &'
alias jl1='jupyter lab --no-browser --port=3001 --ip=0.0.0.0 2> lab1.txt 1>&2 &'
alias jl2='jupyter lab --no-browser --port=3002 --ip=0.0.0.0 2> lab2.txt 1>&2 &'
alias jl3='jupyter lab --no-browser --port=3003 --ip=0.0.0.0 2> lab3.txt 1>&2 &'
alias jl4='jupyter lab --no-browser --port=3004 --ip=0.0.0.0 2> lab4.txt 1>&2 &'
alias jl5='jupyter lab --no-browser --port=3005 --ip=0.0.0.0 2> lab5.txt 1>&2 &'

alias tb="nc termbin.com 9999"
# fd, rg, pt, ag, fzf, hexyl

shopt -s histappend # append to history file
HISTSIZE=75000      # lines in memory
HISTFILESIZE=150000 # lines in file

APPS=/home/chyld/.local/secret
export PATH=$APPS/node/bin:$APPS/git-prompt:$APPS/conda-prompt:$PATH

. ~/.fzf.bash
. "/home/chyld/.local/secret/miniconda3/etc/profile.d/conda.sh"
conda activate py37
eval "$(lua /home/chyld/.local/secret/z.lua/z.lua --init bash enhanced once fzf)"

set_bash_prompt(){
  PS1="`conda-prompt.js` $c0\u$c3@$c0\h $u$c4\w$r `git-prompt.js` $c0>$r "
}

PROMPT_COMMAND=set_bash_prompt

