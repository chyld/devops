### ------------------------------------------------------------------ ###
source ~/.bash_aliases
source ~/.bash_colors
### ------------------------------------------------------------------ ###
branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "{" $2 "} "}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0) print "# "}'
}

dirty()
{
  git branch -v 2> /dev/null | awk '{if($1 == "*") print $0}' | branch-sync
}

dirsize()
{
  ls -al | wc | awk '{print $1 - 3}'
}
### ------------------------------------------------------------------ ###

LOCAL=$HOME/.local
ANACONDA_PATH=$LOCAL/anaconda3/bin
NODE_PATH=$LOCAL/node/bin
RVM_PATH=$HOME/.rvm/bin

export PYTHONDONTWRITEBYTECODE=1 # suppress __pycache__
export HISTSIZE=100000
export EDITOR=vim
export GOPATH=$HOME/Code/go

# PATH also set in /etc/paths & /etc/paths.d
export PATH=$ANACONDA_PATH:$NODE_PATH:$RVM_PATH:$GOPATH/bin:$PATH

# export PS1="\n$crimson[⌗ \!] $aliceblue\u@\h $crimson[✤ \A]$reset\n$gold\w $aqua[\$(dirsize)] $snow\$(status)$fuchsia\$(branch)$gold:$reset "
export PS1="$gold[\w] $snow\$(status)$aqua\$(dirty)$fuchsia\$(branch)$greenyellow:$reset "

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
