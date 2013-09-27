[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

set -o vi
export CLICOLOR=1

PS1='$(last_error)$(box_name):$(cwd)$(vcs_branch)$(job_count) \$ '

[ -d ~/bin ] && export PATH="~/bin:$PATH"
[ -f ~/.box_bashrc ] && source ~/.box_bashrc

alias vi=vim

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
    local jobc=0
    while read -r _; do
        ((jobc++))
    done < <(jobs -p)
    if ((jobc > 0)); then
        printf ' {%d}' "$jobc"
    fi
}

function cwd {
    local cwd
    cwd=$(pwd | sed -e "s,^$HOME,~," | sed -e 's#\([a-zA-Z]\)[a-zA-Z]*[^/]*/#\1/#g')
    
    printf '%s' "$cwd"
}

