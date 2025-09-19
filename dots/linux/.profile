# .profile
#
# this file runs once when you login to gnome
# it defines the environment variables that all the child processes
# will inherit, like all gui apps or even terminal apps
# ------------------------------------------------------------------------ #

logger -t "chyld-debug" "$(date '+%Y:%m:%d:%H:%M:%S') - .profile"

BIN_HOME="$HOME/bin"
export PATH=$BIN_HOME:$BIN_HOME/node/bin:$BIN_HOME/exports:$BIN_HOME/distrobox/bin:$BIN_HOME/scripts:$PATH
