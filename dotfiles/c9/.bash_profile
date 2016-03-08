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

export LOCAL=$HOME/.local
export GIT_PATH=$LOCAL/git/bin
export GO_PATH=$LOCAL/go/bin
export REDIS_PATH=$LOCAL/redis/src

export EDITOR=vim
export GOROOT=$LOCAL/go
export PYTHONDONTWRITEBYTECODE=1 # suppress __pycache__

[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$GIT_PATH:$GO_PATH:$REDIS_PATH:$PATH
export PS1="$txtylw\u$txtred@$txtylw\h $txtwht\w $txtred\$(status)$txtgrn\$(branch)$txtylw>$txtrst "

