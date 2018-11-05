#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")"

function link {
    local a="$1"
    local b="$2"

    [[ -e "$b" ]] && echo "Skipping $b" && return
    ln -s "$a" "$b" && echo "Linked $a => $b"
}

link "bashrc"        ~/.bashrc
link "inputrc"       ~/.inputrc
link "vimrc"         ~/.vimrc
link "gitconfig"     ~/.gitconfig
link "git_template"  ~/.git_template
link "tmux.conf"     ~/.tmux.conf
link "hammerspoon"   ~/.hammerspoon
mkdir -p ~/.docker && link "docker_config" ~/.docker/config.json
