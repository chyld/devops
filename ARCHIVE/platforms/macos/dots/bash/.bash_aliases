# use single quotes, no variable expansion or string interpolation

alias sdo='cd ~/Code/devops && git acm "sync" && git push; cd ~'

alias l='exa -lag'
# alias l='ls -pahlGF'
alias ll='l'
alias b='cd ..'
alias c='clear'
alias ds="find . -name '.DS_Store' -type f -delete"

alias dps='docker ps -a'
alias dka='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dna='dka; docker system prune -f; rm -rf ~/Data/*;'
alias mysqldb='docker run --name titan -d -e MYSQL_ROOT_PASSWORD=pass1234 -p 3306:3306 -v /Users/chyld/Data/mysql/data:/var/lib/mysql -v /Users/chyld/Data/mysql/logs:/var/log/mysql mysql'
alias pgsqldb='docker run --name raptor -d -e POSTGRES_PASSWORD=pass1234 -p 5432:5432 -v /Users/chyld/Data/postgres/data:/var/lib/postgresql/data postgres'
alias mongodb='docker run --name falcon -d -p 27017:27017 -v /Users/chyld/Data/mongodb/data:/data/db mongo'

alias g='git'
alias v='vagrant'
alias n='node'
alias r='ruby'
alias p='python'
alias k='kubectl'
alias d='docker'
alias dc='docker-compose'

alias dbg='clear && cat ~/Code/devops/notes/debugging.txt'
alias cmd='clear && cat ~/Code/devops/notes/commands.txt'
