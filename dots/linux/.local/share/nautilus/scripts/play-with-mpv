#!/bin/bash

# view log at /var/log/syslog
# it is executed as the logged in user
# the current working directory is the folder you are in currently

IFS=$'\n'
for file in $NAUTILUS_SCRIPT_SELECTED_FILE_PATHS; do
  logger -t "chyld-mpv" "mpv playing file ${file}"
  /home/xero/.bin/distrobox/exports/mpv "$file" &
done
