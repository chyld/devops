txtblk='\[\e[0;30m\]' # Black
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
txtrst='\[\e[0m\]'    # Text Reset

alias    l='ls -a'
alias   ll='ls -alh'
alias    b='cd ..'
alias    c='clear'
alias code='cd ~/Documents/Code'
alias ds="find . -name '.DS_Store' -type f -delete"

export PATH="/Users/chyld/.local/node/bin:/Users/chyld/miniconda3/bin:$PATH"

export EDITOR=vim
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1="$txtylw\u$txtred@$txtylw\h $txtblu\w$txtwht >$txtrst "
