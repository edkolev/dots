# Script should be sourced like so:
# if [[ $SSH_CLIENT == *192.168.10.94* || $SSH_CLIENT == *192.168.10.233* ]]; then
#    /path/to/remote_profile.sh
# ...

DOTS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# bash
source $DOTS_DIR/bashrc
bind -f $DOTS_DIR/inputrc
export HISTFILE=$DOTS_DIR/bash_history
export LANG=C LC_CTYPE=C

# vim
export MYVIMRC=$DOTS_DIR/vimrc
alias vi="vim -u $DOTS_DIR/vimrc"
alias vim="vim -u $DOTS_DIR/vimrc"
alias vimdiff="vimdiff -u $DOTS_DIR/vimrc"

# tmux
alias tmux="tmux -f $DOTS_DIR/tmux.conf -L edkolev"
