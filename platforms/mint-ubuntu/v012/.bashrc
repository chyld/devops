# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

. "$HOME/.cargo/env"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

scriptsbin=$HOME/Code/devops/scripts
nodebin=$HOME/.local/node/bin
export PATH=$scriptsbin:$nodebin:$PATH

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

alias c="clear"
alias b="cd .."
alias rcp="find -name .ipynb_checkpoints | xargs -I @@ rm -rf @@"
alias cat="bat"
alias cut="tuc"
alias t="tree -a -I .git"
alias du="duf"
alias vi="nvim"
alias dots="cd $HOME/Code/devops/platforms/mint-ubuntu/v012"
alias mac="cd $HOME/macOS"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

alias l="exa --icons --git -aF"
alias ll="exa --icons --git -laF"
alias cl="c && l"
alias cll="c && ll"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

alias g="git"
alias gs="git status"
alias grh="git reset HEAD --hard && git clean -fd"
alias gl="git log --oneline --color --graph"
alias gsa="git stash --all"
alias gsl="git stash list"
alias gsc="git stash clear"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chyld/.local/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chyld/.local/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chyld/.local/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chyld/.local/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias ca="conda activate"

activate_conda_environment() {
    does_exist=$(conda env list | grep -i frodo)

    if [ ! -z "$does_exist" ]; then
        conda activate frodo
    fi
}

activate_conda_environment

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

# view any env variable in any process

view_env_variables_by_process_id() {
    cat /proc/"$1"/environ | tr '\0' '\n'
}

# usage, monitor ., or monitor /usr
# this will watch read, write, modify, delete file access - recursively
# a wonderful debugging tool to see what files are being used by a process

monitor() {
  inotifywait -e access,delete,create,modify -m -r "$1"
}

# make the path look nice

path() {
    # prefix the script with tabs, not spaces
    # notice the (pipe) on the next line, this allows the output of the lua program to be piped to nl
	lua <<- EOF |
		s = string.gsub("$PATH", ":", "\n")
		print(s)
	EOF
    nl
}

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

xc() {
    destination=$(x-dir.py) # should be a 2
    retval=$?               # capture the return value before it changes
    if [ $retval -eq 2 ]; then
        cd $destination
        touch README.md
        git init
        git add README.md
        git commit -m "Auto generated from xc"
        ll
    fi
}

xw() {
    num="${1:-1}" # set num to $1 if exists, else set to 1 (default)
    cd $HOME/X
    lastdir=$(exa -1 --sort created | tail -n $num | head -n 1)
    cd $lastdir
    ll
}

alias x="cd $HOME/X"
alias xl="x && exa -RTla --icons --level 1 --sort created -b"
alias xll="x && exa -RTla --icons --level 2 --sort created -b --no-permissions --no-time --no-user"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

# notice the () not {} around the body of this function
# this will run this function in a subshell
# and not pollute the current env with LD_LIBRARY_PATH which can cause problems
# this env variable is required to use tensorflow gpu

jltf() (
    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$CONDA_PREFIX/lib/
    jl "$1"
)

# jl 3333 (to start jupyter lab on port 3333)
# jupyter lab list (to view all running instances)
# File -> ShutDown (to exit, from GUI)

jl() {
    port="$1"
    port_len=$(echo "const s = '$port'; console.log(s.length);" | node)

    # the python script has to be prefixed with tabs (not spaces) or it will not work
    if [ $port_len -eq 0 ]; then
		port=$(python <<- EOF
			from scipy.stats import randint
			n = randint(2_000, 10_000).rvs()
			print(n)
		EOF
		)
    fi

    echo "Starting jupyter lab on port $port. Use jll to see a list of running servers."
    nohup jupyter lab --no-browser --ip="0.0.0.0" --port="$port" --ServerApp.token="" 1> "$port"-a.log 2> "$port"-b.log &
}

# kill all instances of jupyter lab

jlkill() {
    ps -ux | rg -v rg | rg jupyter-lab | tuc -e '\s+' -f 2 | xargs -I @@ kill -s SIGKILL @@
}

alias jll="jupyter lab list"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash)"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #

eval "$(starship init bash)"

# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
# ---------------------------------------------------------------------------- #
