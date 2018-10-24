if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

source $HOME/.nvm/nvm.sh
unalias python
export PATH=$HOME/.local/bin:$HOME/bin:$HOME/.local/conda/bin:$HOME/.local/maven/bin:$PATH
