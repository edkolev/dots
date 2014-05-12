[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

set -o vi
export CLICOLOR=1
export EDITOR=vim

PS1='$(last_error)$(box_name):$(cwd)$(vcs_branch)$(job_count \j) \$ '

[ -d ~/bin ] && export PATH="~/bin:$PATH"
[ -f ~/.box_bashrc ] && source ~/.box_bashrc
[ -f ~/dots/z/z.sh ] && source ~/dots/z/z.sh
[ -f ~/.promptline.sh ] && source ~/.promptline.sh

alias vi=vim

# better history
HISTTIMEFORMAT='%F %T '
HISTIGNORE='ls:bg:fg:history'
HISTCONTROL=ignoreboth
shopt -s histappend


function vman {
  vim -c "Man $1" -c on
}

# avoid duplicates in history
export HISTCONTROL=ignoredups

function box_name {
    [ -f ~/.box_name ] && cat ~/.box_name || hostname -s
}

function last_error {
    if [[ $? != 0 ]]; then echo "✗ "; fi
}

function svn_branch {
   hash svn 2>/dev/null || return 1

   if ! svn info >/dev/null 2>&1; then
      return 1
   fi

   local info=$(svn info 2>/dev/null)
   local url=$(awk -F': ' '$1 == "URL" {print $2}' <<<"$info")
   local root=$(awk -F': ' '$1 == "Repository Root" {print $2}' <<<"$info")

   local branch
   branch=${url/$root}
   branch=${branch#/}
   branch=${branch#branches/}
   branch=${branch%%/*}

   printf ' ⎇ %s' "${branch:-unknown}"
}

function git_branch {
   hash git 2>/dev/null || return 1

   local gitdir=$(git rev-parse --is-inside-git-dir 2>/dev/null)
   if [[ $gitdir == true ]]; then
      return 1
   fi

   local worktree=$(git rev-parse --is-inside-work-tree 2>/dev/null)
   if [[ $worktree != true ]]; then
      return 1
   fi

   if ! git status >/dev/null 2>&1; then
      return 1
   fi

   local branch
   branch=$(git symbolic-ref --quiet HEAD 2>/dev/null) \
      || branch=$(git rev-parse --short HEAD 2>/dev/null) \
      || branch='unknown'
   branch=${branch##*/}

   printf ' ⎇ %s' "${branch:-unknown}"
}

# http://blog.sanctum.geek.nz/bash-prompts/
function vcs_branch {
   git_branch || svn_branch
}

function job_count {
  [ $1 -gt 0 ] && printf " {$1}"
}

function cwd {
    local cwd
    cwd=$(pwd | sed -e "s,^$HOME,~," | sed -e 's#\([a-zA-Z]\)[a-zA-Z]*[^/]*/#\1/#g')

    printf '%s' "$cwd"
}

[[ -f ~/.fzf.bash ]] && {
  source ~/.fzf.bash

  # vimf - Open selected file in Vim
  vimf() {
    local file
    file=$(fzf --query="$1") && vim "$file"
  }

  # fd - cd to selected directory
  fd() {
    local dir
    dir=$(find ${1:-*} -path '*/\.*' -prune \
                    -o -type d -print 2> /dev/null | fzf +m) &&
    cd "$dir"
  }

  # fda - including hidden directories
  fda() {
    local dir
    dir=$(find ${1:-.} -type d 2> /dev/null | fzf +m) && cd "$dir"
  }

  # fh - repeat history
  fh() {
    eval $(history | fzf +s | sed 's/ *[0-9]* *//')
  }

  # fkill - kill process
  fkill() {
    ps -ef | sed 1d | fzf -m | awk '{print $2}' | xargs kill -${1:-9}
  }

  # fbr - checkout git branch
  fbr() {
    local branches branch
    branches=$(git branch) &&
    branch=$(echo "$branches" | fzf +s +m) &&
    git checkout $(echo "$branch" | sed "s/.* //")
  }

  # fbr - checkout git commit
  fco() {
    local commits commit
    commits=$(git log --pretty=oneline --abbrev-commit) &&
    commit=$(echo "$commits" | fzf +s +m -e) &&
    git checkout $(echo "$commit" | sed "s/ .*//")
  }

  # fq1 [QUERY]
  # - Immediately select the file when there's only one match.
  #   If not, start the fuzzy finder as usual.
  fq1() {
    local lines
    lines=$(fzf --filter="$1" --no-sort)
    if [ -z "$lines" ]; then
      return 1
    elif [ $(wc -l <<< "$lines") -eq 1 ]; then
      echo "$lines"
    else
      echo "$lines" | fzf --query="$1"
    fi
  }

  # fe [QUERY]
  # - Open the selected file with the default editor
  #   (Bypass fuzzy finder when there's only one match)
  fe() {
    local file
    file=$(fq1 "$1") && ${EDITOR:-vim} "$file"
  }
}
