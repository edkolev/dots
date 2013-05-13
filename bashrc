function box_name {
    [ -f ~/.box_name ] && cat ~/.box_name || hostname -s
}

function last_error {
    if [[ $? != 0 ]]; then echo "✗ "; fi
}

set -o vi
export CLICOLOR=1

PS1='$(last_error)$(box_name):\w \$ '

[ -d ~/bin ] && export PATH="~/bin:$PATH"
[ -f ~/.box_bashrc ] && source ~/.box_bashrc
