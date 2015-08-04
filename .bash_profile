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

alias b="cd .."
alias l="ls -al"
alias c="clear"

export EDITOR=vim
export GIT_PATH=/usr/local/git/bin
export PATH=$GIT_PATH:$PATH
export PS1="$txtred\u$txtcyn@$txtylw\h $txtgrn\w$txtblk >$txtrst "

