# --------------------------------------------------------------------------------------------- #

HISTFILE=~/.histfile
HISTSIZE=1000 # history in memory
SAVEHIST=1000 # history in file
setopt autocd beep extendedglob nomatch notify
bindkey -v # setup VI keybindings
zstyle :compinstall filename '/home/chyld/.zshrc'
autoload -Uz compinit
compinit

# --------------------------------------------------------------------------------------------- #

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/chyld/.bin/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/chyld/.bin/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/chyld/.bin/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/chyld/.bin/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# --------------------------------------------------------------------------------------------- #

BIN_PATH=$HOME/.bin
NODE_PATH=$HOME/.bin/node/bin
CODE_PATH=$HOME/.bin/vscode/bin
SCRIPTS_PATH=$HOME/Code/devops/scripts
export PATH=$NODE_PATH:$CODE_PATH:$SCRIPTS_PATH:$PATH
export FZF_DEFAULT_COMMAND=''

# --------------------------------------------------------------------------------------------- #

alias dev="cd ~/Code/devops"
alias dots="cd ~/Code/devops/platforms/mint-ubuntu/v014"
alias bin="cd ~/.bin"
alias dl="cd ~/Downloads"
alias b="cd .."

# --------------------------------------------------------------------------------------------- #

alias ez="vi ~/.zshrc" # edit zsh
alias c="clear"
alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias g="git"
alias gs="git status"
alias gd="git diff"
alias jl="jupyter lab"
alias backlight="cat /sys/class/leds/smc::kbd_backlight/brightness"
alias fonts="fc-list : family | sort | uniq | nl"
alias system="inxi -F"
alias mountnfs="sudo mount -t nfs 192.168.1.10:/mnt/datastore/hydrogen /home/chyld/Share"
alias umountnfs="sudo umount /home/chyld/Share"

# --------------------------------------------------------------------------------------------- #

# exa, eza, lsd
alias     l="lsd -A   --group-directories-first"
alias    ll="eza -la --icons=always --group-directories-first --git-repos --git"
alias   lll="eza -la --icons=always --group-directories-first --git-repos --git --total-size"
alias  llll="lsd -Alg --group-directories-first --tree --blocks size,git,name --ignore-glob .git --ignore-glob __pycache__ --ignore-glob node_modules"
alias    cl="c;l"
alias   cll="c;ll"
alias  clll="c;lll"
alias cllll="c;llll"

# --------------------------------------------------------------------------------------------- #

sd() {
    # copy git password to clipboard
    cat ~/.gitpass | wl-copy
    # update vscode extensions
    echo "=========================" >> ~/Code/devops/platforms/mint-ubuntu/v014/vscode/extensions.txt
    date >> ~/Code/devops/platforms/mint-ubuntu/v014/vscode/extensions.txt
    code --list-extensions | nl >> ~/Code/devops/platforms/mint-ubuntu/v014/vscode/extensions.txt
    # synd dot files to github
    current_dir=$(pwd)
    cd ~/Code/devops
    git status
    git add .
    git commit -am "auto sync"
    git push
    cd "$current_dir"
}

path() {
    path_multi_line=$(python <<-EOF 
		get_path_from_bash = "$PATH"
		post_processed = '\n'.join(get_path_from_bash.split(':'))
		print(post_processed)
		EOF
    )
    echo "$path_multi_line" | nl
}

h() {
    # help
    glow ~/Code/devops/templates/help/linux.md
}

eh() {
    # edit help
    vi ~/Code/devops/templates/help/linux.md
}

xh() {
    # x-help
    glow ~/Code/devops/templates/help/x-help.md
}

x() {
    cd ~/Xplore
}

xl() {
    # x-list simple
    cd ~/Xplore
    lsd --tree --depth 2 -ar --sort time --group-directories-first
}

xll() {
    # x-list detail
    cd ~/Xplore
    lsd --tree --depth 3 -ar --sort time --group-directories-first
}

xp() {
    # x-purge
    rm -rf ~/Xplore/Temp/*
}

xs() {
    # x-save
    curr=$(pwd)
    dest=$(echo $curr | sed 's|/Temp/|/Save/|')
    if gum confirm "$curr to $dest?"; then
        cd ~
        mv "$curr" "$dest"
        cd "$dest"
        echo "directory moved: $(pwd)"
    else
        echo "operation cancelled"
    fi
}

xc() {
    # x-create
    destination=$(xplore.py)   # destination reads stdout from xplore.py
    retval=$?                  # capture the return value before it changes
    if [ $retval -eq 3 ]; then # should be 3
        cd $destination
        gum style \
            --foreground "#ff33cc" --border-foreground "#ccff33" --border normal \
            --align center --width 30 --margin "1 2" --padding "1 2" \
            'Xplore Project Creator'
        # https://www.nerdfonts.com/cheat-sheet
        template=$(gum choose "  nogit" "󰅬  readme" "󰈸  physics" "󰺵  p5js" "  virtual python" "  python" "  javascript" "  typescript" "  lua")
        touch README.md
        case "$template" in
            *nogit)
                # exit, do not want repo
                rm README.md
                return
                ;;
            *readme)
                # nothing here
                ;;
            *physics)
                cp $HOME/Code/devops/templates/physics/physics.ipynb .
                ;;
            *p5js)
                cp $HOME/Code/devops/templates/p5js/* .
                ;;
            *virtual*)
                fake_names 3 py
                python -m venv .venv --prompt planck
                source .venv/bin/activate
                echo ".venv" > .gitignore
                which python
                pip list
                ;;
            *python)
                fake_names 3 py
                ;;
            *javascript)
                echo "node_modules" > .gitignore
                npm init -y
                fake_names 3 js
                ;;
            *typescript)
                echo "node_modules" > .gitignore
                npm init -y
                npm install typescript --save-dev
                npx tsc --init
                fake_names 3 ts
                ;;
            *lua)
                fake_names 3 lua
                ;;
        esac
        git init
        git add .
        git commit -m "Commit Zero"
        git log
        ll
    fi
}

fake_names() {
    count=$1
    extension=$2
    names=$(faker -r=$count color_name)
    for name in $names; do
        no_space="${name// /}"           # Remove all spaces
        no_upper="${no_space,,}"         # Convert to lowercase
        touch "${no_upper}"."${extension}"
    done
}

# --------------------------------------------------------------------------------------------- #

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
conda activate prometheus
eval "$(atuin init zsh)"
eval "$(starship init zsh)"

# --------------------------------------------------------------------------------------------- #

if [ -z "$TMUX" ]; then # $TMUX is ONLY set when it is active.
    tmux new-session
fi

# --------------------------------------------------------------------------------------------- #

