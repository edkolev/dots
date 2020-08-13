#!/bin/bash

function link {
    local a="$1"
    local b="$2"

    [[ -e "$b" ]] && echo "Skipping $b" && return
    ln -s "$a" "$b" && echo "Linked $a => $b"
}

cd "$(dirname "${BASH_SOURCE[0]}")"

link "$PWD/bashrc"        ~/.bashrc
link "$PWD/inputrc"       ~/.inputrc
link "$PWD/vimrc"         ~/.vimrc
link "$PWD/gitconfig"     ~/.gitconfig
link "$PWD/git_template"  ~/.git_template
link "$PWD/tmux.conf"     ~/.tmux.conf
