# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

export PATH
source $HOME/.nvm/nvm.sh

# -------------------------------------------------- #

unalias python
export PATH=$HOME/.local/conda/bin:$PATH
