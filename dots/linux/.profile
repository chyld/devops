if [ -z "$IS_LOADED" ]; then
  OLD_PATH="$PATH"
  source $HOME/.bashrc
  export PATH="$OLD_PATH"
fi
