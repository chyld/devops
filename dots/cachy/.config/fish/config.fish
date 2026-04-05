source /usr/share/cachyos-fish-config/cachyos-config.fish

function vi
    nvim $argv
end

function g 
    git $argv
end

function cat
    bat $argv
end

function ef
    nvim $HOME/.config/fish/config.fish
end

function c
    clear
end

function b
    cd ..
end

function l
    eza -a       --icons --group-directories-first $argv
end

function ll
    eza -al      --icons --group-directories-first $argv
end

function lll
    eza -aT -L 2 --icons --group-directories-first $argv
end

function llll
    eza -aT      --icons --group-directories-first $argv
end

function cl
    c
    l
end

function cll
    c
    ll
end

function clll
    c
    lll
end

function cllll
    c
    llll
end

function dl
    cd ~/Downloads
end

function pushdots
    set orig_dir (pwd)
    cd ~/Code/devops
    git add .
    git commit -am "pushdots"
    git push
    cd $orig_dir
end

function v
    set timestamp (date +%y%m%d-%H%M)
    set suffix (printf '%03x' (math (random) % 4096))
    set dirname $HOME/Void/$timestamp.$suffix

    mkdir -p $dirname
    and cd $dirname
end

