### ------------------------------------------------------------------ ###
source ~/.bash_aliases
source ~/.bash_colors
### ------------------------------------------------------------------ ###
branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "{" $2 "} ";}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0)print"+";}'
}

dirsize()
{
  ls -al | wc | awk '{print $1 - 3}'
}
### ------------------------------------------------------------------ ###

LOCAL=$HOME/.local
ANACONDA_PATH=$LOCAL/anaconda3/bin
NODE_PATH=$LOCAL/node/bin

export PYTHONDONTWRITEBYTECODE=1 # suppress __pycache__
export HISTSIZE=100000
export PATH=$ANACONDA_PATH:$NODE_PATH:$PATH

# export PS1="\n$crimson[⌗ \!] $aliceblue\u@\h $crimson[✤ \A]$reset\n$gold\w $aqua[\$(dirsize)] $snow\$(status)$fuchsia\$(branch)$gold:$reset "
export PS1="$crimson[\A] $gold\w $aqua[\$(dirsize)] $snow\$(status)$fuchsia\$(branch)$gold:$reset "
