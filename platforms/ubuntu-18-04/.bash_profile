# paths
conda_path=$HOME/miniconda3/bin
node_path=$HOME/.local/apps/node/bin
export PATH=$conda_path:$node_path:$PATH

# aliases
alias l='ls -ahlG --color'
alias ll='l'
alias c='clear'
alias b='cd ..'
alias g='git'

# https://coolors.co/
red="\[\e[38;2;226;52;52m\]"
yel="\[\e[38;2;247;240;82m\]"
org="\[\e[38;2;255;255;120m\]"
blu="\[\e[38;2;91;192;235m\]"
grn="\[\e[38;2;155;197;61m\]"
gry="\[\e[38;2;100;100;100m\]"
reset="\[\e[0m\]"

# functions
branch()
{
  git branch 2> /dev/null | awk '/\*/ {print "{" $2 "} "}'
}

status()
{
  git status --porcelain 2> /dev/null | wc | awk '{if($1 > 0) print "# "}'
}

remote()
{
  git remote get-url --all origin 2> /dev/null | ~/Scripts/remote.py
}

dirsize()
{
  ls -al | wc | awk '{print $1 - 3}'
}

binary()
{
  cat /dev/urandom | head -n 10 | xxd -c 30 | head -n 1 | awk '{print $2 "-" $3}'
}

# prompt
line0="\n\n# --------------------------------------------------$org\$(binary)$reset-- :::\n"
line1="$reset#$yel \$(dirsize) $reset//$gry \D{%Y-%m-%d} $reset//$gry \u@\h\n"
line2="$reset#$red \w $yel\$(branch)$red\$(status)$reset//$grn \$(remote)\n"
line3="$reset#$blu [\#]: $reset"
line4="$red\w $yel\$(branch)$red\$(status)$blu[\#]: $reset"
export PS1=$line4
