[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

export CLICOLOR=1
export EDITOR=vim

PS1='\h: \W/$(git_branch)$(job_count \j) ❯ '

[ -d ~/bin ] && export PATH="~/bin:$PATH"
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
[ -f ~/.promptline.sh ] && source ~/.promptline.sh

alias vi=vim
alias -- -='cd -'
alias -- ..='cd ..'
alias -- ...='cd ../..'

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias gcd='if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then cd $(git rev-parse --show-toplevel); else echo "not in a git repository"; fi'

HISTTIMEFORMAT='%F %T '
HISTIGNORE='ls:bg:fg:history:clear:..:...:-'
HISTCONTROL=ignoreboth
shopt -s histappend
HISTSIZE=10000
HISTFILESIZE=10000

shopt -s globstar

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

   git status >/dev/null 2>&1 || return 1

   local branch
   branch=$(git symbolic-ref --quiet HEAD 2>/dev/null) \
      || branch=$(git rev-parse --short HEAD 2>/dev/null) \
      || branch='unknown'
   branch=${branch##*/}

   printf ' %s' "${branch:-unknown}"
}

function job_count {
  [ $1 -gt 0 ] && printf " {$1}"
}

function man {
  env \
    MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma ls=0' -c 'map q :quit<cr>' -\"" \
    man "$@"
}

function ffind {
  find . -name "$@"
}
