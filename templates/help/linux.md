# linux notes

## utilities

- git                           # source control
- find/fd                       # find files
- grep/rg                       # search within files
- fzf                           # fuzzy finder
- top/htop/btop                 # process monitor
- hexyl                         # hex viewer
- delta                         # diff viewer
- watch/watchexec/entr          # file watcher
- xargs                         # command line construction
- strace                        # monitor open files by process

## bash

- var=("red" "blue" "green")    # an array
- var=$(ls)                     # launch a subshell and return the results
- echo $var or echo ${var}      # dereference a variable

## video

- mpv [filename]                # play a file

## misc

- https://github.com/charmbracelet/huh # tui form builder
- gum                           # interactive shell script builder

## scripts

- list all the files in a directory (including subdirectories) and sort by datetime
- `find . -type f -exec ls -l --time-style=long-iso {} + | sort -k 6,7`
- convert webm to mp4 using x264 video and aac audio codecs
- `ffmpeg -i input.webm -c:v libx264 -c:a aac output.mp4`

## vscode

- you can drag a file OUTSIDE of vscode, to create a new window

