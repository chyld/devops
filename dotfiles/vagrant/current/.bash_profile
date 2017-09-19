### ------------------------------------------------------------------ ###
source ~/.bashrc
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

CONDA_PATH=$LOCAL/miniconda3/bin
NODE_PATH=$LOCAL/node/bin
GO_PATH=$LOCAL/go/bin
DEVOPS_PATH=/home/vagrant/System/devops/dotfiles/vagrant/current/bin

export PYTHONDONTWRITEBYTECODE=1 # suppress __pycache__
export HISTSIZE=100000
export EDITOR=vim
export GOPATH=/home/vagrant/macos/go
export PATH=$CONDA_PATH:$NODE_PATH:$GO_PATH:$DEVOPS_PATH:$PATH
export PS1="$fuchsia[${aqua}xenial $fuchsia\w] $snow\$(status)$aqua\$(dirty)$gold\$(branch)$greenyellow:$reset "
### ------------------------------------------------------------------ ###

