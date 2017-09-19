# use single quotes, no variable expansion or string interpolation

alias sdo='cd ~/System/devops && git add . && git commit -am "sync" && git push; cd ~'

alias l="ls -Alhp --color=auto"
alias ll='l'
alias b='cd ..'
alias c='clear'

alias g='git'
alias n='node'
alias p='python'
alias k='kubectl'
alias d='docker'

alias debug='clear && cat ~/System/devops/notes/debugging.txt'

# DOCKER ALIASES ---------------------------------------------------- #
alias dka='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dna='dka; docker system prune -f'
alias dps='docker ps -a'
alias pgsqldb='docker run --name raptor -d -e POSTGRES_PASSWORD=pass1234 -p 5432:5432 -v /home/ubuntu/Data/postgres/data:/var/lib/postgresql/data postgres'
# DOCKER ALIASES ---------------------------------------------------- #
