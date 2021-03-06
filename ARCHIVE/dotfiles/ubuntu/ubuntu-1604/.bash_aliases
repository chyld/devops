alias l="LC_COLLATE=C ls -Alhp --color=auto --group-directories-first"
alias g="git"
alias ll="l"
alias b="cd .."
alias c="clear"
alias down="cd ~/Downloads"
alias mongos="docker run --name viper -d -p 27017:27017 -v /home/chyld/Data/mongo:/data/db mongo"
alias mongoc="docker run -it --link viper:mongo --rm mongo sh -c 'exec mongo "'"$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'"'"
alias pgs="docker run --name raptor -d -p 5332:5432 -v /home/chyld/Data/pg:/var/lib/postgresql/data -e POSTGRES_PASSWORD=password1 postgres"
alias pgc="docker run -it --rm --link raptor:postgres postgres psql -h postgres -U postgres"
