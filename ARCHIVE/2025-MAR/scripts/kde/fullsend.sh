#!/usr/bin/bash

location=$1
echo "$(date) -- full send on location: $location" >> /home/chyld/.logs/fullsend.log

cd "$location"
/home/chyld/.bin/vscode/bin/code .
konsole &
echo "$(date) -- full send complete" >> /home/chyld/.logs/fullsend.log

