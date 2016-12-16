#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

for link in bashrc inputrc vimrc gitconfig git_template tmux.conf hammerspoon; do
  [[ -e ~/.${link} ]] && echo "Skipping $link" && continue
  ln -s ${BASEDIR}/${link} ~/.${link} && echo "Linked $link"
done
