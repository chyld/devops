# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'


# Omarchy environment (OMARCHY_PATH + PATH), needed even for non-interactive shells
[[ -r /usr/share/omarchy/default/bash/env-bootstrap ]] && source /usr/share/omarchy/default/bash/env-bootstrap

# If not running interactively, don't do anything else (leave this above the rc source)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source "$OMARCHY_PATH/default/bash/rc"

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

alias c="clear"
alias b="cd .."
alias g="git"
alias d="docker"
alias vi="nvim"
alias cat="bat"
alias eb="vi $HOME/.bashrc"

alias    l="eza -a        --icons --group-directories-first"
alias   ll="eza -al       --icons --group-directories-first"
alias  lll="eza -alT -L 2 --icons --group-directories-first"
alias llll="eza -alT -L 3 --icons --group-directories-first"

alias   lt="eza -lar -s changed" # show changed files at the top of the list

alias cl="c && l"
alias cll="c && ll"
alias clll="c && lll"
alias cllll="c && llll"

alias claudeyolo="claude --dangerously-skip-permissions"
alias codexyolo="codex --yolo"
alias grokyolo="grok --yolo"
alias museyolo="muse --yolo"
alias opencodeyolo="opencode --yolo"

case ":$PATH:" in
  *":$HOME/Scripts:"*) ;;
  *) export PATH="$HOME/Scripts:$PATH" ;;
esac

# Create temp directory
v() {
  local directory
  directory=$("$HOME/Scripts/mkvoid") || return
  builtin cd -- "$directory"
}

# Delete empty directories directly under ~/Void.
vd() {
  find "$HOME/Void" -mindepth 1 -maxdepth 1 -type d -empty -delete -print
}

# List all temp directories.
vl() {
  cd $HOME/Void
  cl
}

# Show all herdr sessions
hh() {
  herdr session list
}

# Stop and delete Herdr sessions, leaving the current one (or default, outside Herdr) untouched.
hhh() {
  local keep="${HERDR_SESSION:-default}"
  local name status rest
  while read -r name status rest; do
    [[ -z "$name" || "$name" == "name" || "$name" == "default" || "$name" == "$keep" ]] && continue
    if [[ "$status" != "stopped" ]]; then
      herdr session stop "$name" || continue
    fi
    herdr session delete "$name"
  done < <(herdr session list)
}

# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #
# ------------------------------------------------------------------------------------------------ #

