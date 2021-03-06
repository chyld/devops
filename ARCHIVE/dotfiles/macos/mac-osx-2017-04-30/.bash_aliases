# use single quotes, no variable expansion or string interpolation

alias l='ls -pahlGF'
alias ll='l'
alias b='cd ..'
alias c='clear'

alias d='docker'
alias dps='docker ps -a'
alias dka='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias mysqldb='docker run --name titan -d -e MYSQL_ROOT_PASSWORD=pass1234 -p 3306:3306 -v /Users/chyld/Data/mysql/data:/var/lib/mysql -v /Users/chyld/Data/mysql/logs:/var/log/mysql mysql'
alias pgsqldb='docker run --name raptor -d -e POSTGRES_PASSWORD=pass1234 -p 5432:5432 -v /Users/chyld/Data/postgres/data:/var/lib/postgresql/data postgres'

alias g='git'
alias n='node'
alias p='python'

alias ds="find . -name '.DS_Store' -type f -delete"
