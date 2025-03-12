alias c="clear"
alias b="cd .."
alias vi="nvim"
alias cat="bat"
alias g="git"
alias gs="git status"
alias gl="git log --oneline"
alias dl="cd $HOME/Downloads"
alias dev="cd $HOME/Developer"
alias devops="cd $HOME/Developer/devops"
alias dots="cd $HOME/Developer/devops/platforms/zzz/2025-02-macos"
alias l="eza -a --icons --group-directories-first"
alias ll="eza -al --icons --group-directories-first"
alias cl="c && l"
alias cll="c && ll"

. $HOME/.keys

path() {
  echo $PATH | tr ':' '\n' | nl
}

ez() {
  vi $HOME/.zshrc
}

aider() {
  uvx --python 3.12 --from aider-chat aider --model anthropic/claude-3-7-sonnet-20250219 --anthropic-api-key $MY_ANTHROPIC_KEY
}

export NVM_DIR="$HOME/.nvm"

. "$NVM_DIR/nvm.sh"
. "$HOME/.local/bin/env"

eval "$(starship init zsh)"

