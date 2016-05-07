source ~/.bashrc
source ~/.profile

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

LOCAL=$HOME/.local
NODE_PATH=$LOCAL/node/bin
GIT_PATH=$LOCAL/git/bin
CONDA_PATH=$LOCAL/conda/bin

export PATH=$NODE_PATH:$GIT_PATH:$CONDA_PATH:$PATH
export PS1="$txtylw\u$txtred@$txtylw\h $txtwht\w $txtred\$(status)$txtgrn\$(branch)$txtylw>$txtrst "
