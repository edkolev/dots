[ -z "$PS1" ] && return
[[ $- != *i* ]] && return

PS1="\w \$ "

# support shell prompt markers OSC-133
function prompt_marker { printf '\e]133;A\e\\'; }
PROMPT_COMMAND=prompt_marker

export CLICOLOR=1
export EDITOR=vim
export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
export COLORTERM=truecolor

[ -d ~/bin ] && export PATH="$HOME/bin:$PATH"
[ -f ~/.bashrc.local ] && source ~/.bashrc.local
[ -f ~/.promptline.sh ] && source ~/.promptline.sh

alias vi=vim
alias e="emacs --no-window-system"
alias -- -='cd -'
alias -- ..='cd ..'
alias -- ...='cd ../..'

alias tpaste="tmux save-buffer -"
alias tcopy="tmux load-buffer -"
# for consistency with :Tyank / :Tcopy in vim/emacs
alias tput="tmux save-buffer -"
alias tyank="tmux load-buffer -"

if [[ $OSTYPE == darwin* ]]; then
   alias ls='ls -G'
else
   alias ls='ls --color=auto'
fi
alias grep='grep -I --color=auto'

HISTTIMEFORMAT='%F %T '
HISTIGNORE='ls:bg:fg:history:clear:..:...:-'
HISTCONTROL=ignoreboth:erasedups
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

function vgrep {
   vim -c "grep '$1'"
}

function evgeni_project_root {
  local prj_root=""
  d="$PWD"
  while [ "$d" != "/" ]; do
    d=$(dirname "$d")
    if [ -e "$d/.project" ]; then
      prj_root="$d"
      break
    fi
  done

  local git_root=""
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == true ]]; then
    git_root=$(git rev-parse --show-toplevel)
    if [ "$git_root" = "$PWD" ]; then
      git_root=""
    fi
  fi

  local root="."
  if [ "$prj_root" = "" ] && [ "$git_root" = "" ]; then
    echo 1>&2 "no upper project"
  elif [[ -n "$prj_root" && -n "$git_root" && "$git_root" = $prj_root* ]]; then
    root="$git_root"
  elif [[ -n "$prj_root" && -n "$git_root" && "$prj_root" = $git_root* ]]; then
    root="$prj_root"
  elif [ "$prj_root" != "" ]; then
    root="$prj_root"
  elif [ "$git_root" != "" ]; then
    root="$git_root"
  fi

  echo "$root"
}

alias gcd='cd "$(evgeni_project_root)"'

function pick_emacs_project() {
  local PS3="project: " COLUMNS=1000
  select file in $(cat ~/.emacs.d/var/project-list.el | grep -v '^;' | tr '()' ' ' | tr -d '"'); do
    if [ "$file" ]; then
      echo "${file/#\~/$HOME}"
      return
    else
       >&2 echo "Bad choice"
    fi
  done
}

alias j='cd $(pick_emacs_project)'
