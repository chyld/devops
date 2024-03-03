# linux notes

## utilities

- git                           # source control
- find/fd                       # find files
- grep/rg/ug                    # search within files
- fzf                           # fuzzy finder
- top/htop/btop                 # process monitor
- hexyl                         # hex viewer
- watch/watchexec/entr          # file watcher
- xargs                         # command line construction
- strace                        # monitor open files by process
- gum                           # interactive shell script builder
- stat                          # show all file statistics
- lazygit                       # manage git repositories
- ss                            # get code help at the terminal
- mods                          # just chat with a LLM

## bash

- var=("red" "blue" "green")    # an array
- var=$(ls)                     # launch a subshell and return the results
- var="$(ls)"                   # NOT NEEDED. Output of command substitution will ALWAYS be treated as a single string.
- echo "$var"                   # use double quotes around, dereference a variable
- echo "${var:1}world"          # use double quotes around - better for string concatenation and string manipulation 
- fn() {...}                    # define a function
- fn() (...)                    # function will run in a subshell
- set -x                        # put at the top of every bash script, excellent for debugging

## video

- mpv [filename]                # play a file

## tmux

- clipboard is integrated with the system
- to copy (press p-[, space to start selection, press enter to copy)
- to paste (press p-])
- you can also use VI search features to find what you are looking for

## scripts

- `rsync -avz (source) (destination)`
- list all the files in a directory (including subdirectories) and sort by datetime
- `find . -type f -exec ls -l --time-style=long-iso {} + | sort -k 6,7`
- convert webm to mp4 using x264 video and aac audio codecs
- `ffmpeg -i input.webm -c:v libx264 -c:a aac output.mp4`
- `convert hello.png goodbye.jpg` # image format conversion

## vscode

- you can drag a file OUTSIDE of vscode, to create a new window

## bash scripting

shellcheck demo.sh
set -x  # add this at the top of your scripts, excellent debugging
"$var" or "${var}" # quote variables
export dog=3 vs dog=3 # env vs shell variables
$0, $1, $2, $@ # args to a script, last is an array of args
bash demo.sh vs source demo.sh # runs in a subprocess vs same process
'' vs "" # no expand vs expand
*, ?, [abc] # 0+ chars vs 1 char vs (a b or c)
wc < file.txt # stdin
cmd 1> file.txt 2>&1 # send stdout and stderr to file.txt

