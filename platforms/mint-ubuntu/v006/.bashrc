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
alias tb="nc termbin.com 9999"
# fd, rg, pt, ag, fzf, hexyl

APPS=/home/chyld/.local/secret
export PATH=$APPS/node/bin:$PATH
export PS1="$c0\u$c3+$c0\h $u$c4\w$r "

. ~/.fzf.bash
. "/home/chyld/.local/secret/miniconda3/etc/profile.d/conda.sh"
conda activate py37

