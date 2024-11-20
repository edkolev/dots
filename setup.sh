#!/bin/bash

set -euo pipefail

function link {
    local a="$1"
    local b="$2"

    if [ ! -d $(dirname "$b") ]; then
        echo "Creating dir for $b"
        mkdir -p $(dirname "$b")
    fi

    [[ -e "$b" ]] && echo "Skipping $(basename $a)" && return
    ln -s "$a" "$b" && echo "Linked $(basename $a) => $b"
}

cd "$(dirname "${BASH_SOURCE[0]}")"

link "$PWD/bashrc"             ~/.bashrc
link "$PWD/inputrc"            ~/.inputrc
link "$PWD/vimrc"              ~/.vimrc
link "$PWD/gitconfig"          ~/.gitconfig
link "$PWD/git_template"       ~/.git_template
link "$PWD/tmux.conf"          ~/.tmux.conf
link "$PWD/ripgreprc"          ~/.ripgreprc
link "$PWD/hammerspoon"        ~/.hammerspoon
link "$PWD/docker_config.json" ~/.docker/config.json
link "$PWD/alacritty.toml"     ~/.config/alacritty/alacritty.toml
