source /usr/share/cachyos-fish-config/cachyos-config.fish

function oc
    openclaw $argv
end

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

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

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

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

function yt1
    uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp $argv
end

function yt2
    uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp --hls-use-mpegts --retries infinite --fragment-retries 50 $argv
end

function yt3
    uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp --hls-use-mpegts --retries infinite --fragment-retries 50 --remote-components ejs:github $argv
end

function yt4
    uvx --refresh --with yt-dlp@git+https://github.com/yt-dlp/yt-dlp.git yt-dlp --hls-use-mpegts --retries infinite --fragment-retries 50 --remote-components ejs:github --cookies-from-browser chrome $argv
end

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

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

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

function v
    set timestamp (date +%y%m%d-%H%M)
    set suffix (printf '%03x' (math (random) % 4096))
    set dirname $HOME/Void/$timestamp.$suffix

    mkdir -p $dirname
    and cd $dirname
end

function vl
    cd ~/Void
    ll
end

function vd
    for dir in (fd --type empty --type d --max-depth 1 --base-directory ~/Void)
        rm -rf ~/Void/$dir
        echo "Deleted: $dir"
    end
    vl
end

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
