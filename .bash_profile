source ~/.bashrc

txtblk='\[\e[0;30m\]' # Black
txtred='\[\e[0;31m\]' # Red
txtgrn='\[\e[0;32m\]' # Green
txtylw='\[\e[0;33m\]' # Yellow
txtblu='\[\e[0;34m\]' # Blue
txtpur='\[\e[0;35m\]' # Purple
txtcyn='\[\e[0;36m\]' # Cyan
txtwht='\[\e[0;37m\]' # White
txtrst='\[\e[0m\]'    # Text Reset

branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "{" $2 "} ";}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0)print"+";}'
}

alias b="cd .."
alias l="ls -al"
alias c="clear"
alias code="cd ~/Code"

export PYTHONDONTWRITEBYTECODE=1 # suppress __pycache__

export EDITOR=vim
export LOCAL=$HOME/.local/install
export GIT_PATH=$LOCAL/git/bin
export NODE_PATH=$LOCAL/node/bin
export GO_PATH=$LOCAL/go/bin
export CONDA_PATH=$LOCAL/miniconda3/bin
export RVM_PATH=$HOME/.rvm/bin

export PATH=$GIT_PATH:$NODE_PATH:$GO_PATH:$CONDA_PATH:$RVM_PATH:$PATH
export PS1="$txtylw\u$txtred@$txtylw\h $txtwht\w $txtred\$(status)$txtgrn\$(branch)$txtylw>$txtrst "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
