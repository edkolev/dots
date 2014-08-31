# bundles {{{
source ~/dots/antigen/antigen.zsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Tarrasch/zsh-bd
antigen apply
# }}}

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
ZLE_RPROMPT_INDENT=0
[ $SHLVL -eq 1 ] && [ -d "$HOME/perl5/lib/perl5" ]  && eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

[ -d "/usr/local/bin" ] && PATH="/usr/local/bin:$PATH"
[ -d ~/bin ] && export PATH="~/bin:$PATH"
[ -f ~/.promptline.sh ] && source ~/.promptline.sh

alias vi=vim

bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

bindkey -e
setopt hist_ignore_all_dups
setopt extendedglob

autoload -Uz compinit
compinit
zstyle ':completion:*' menu no-select

# tmux pane completion {{{
_tmux_pane_words() {
  local expl
  local -a words

  if [[ -z "$TMUX_PANE" ]]; then; _message "not running inside tmux!"; return 1; fi

  words=( ${(u)=$(tmux capture-pane -J -p)} )
  _wanted values expl 'words from current tmux pane' compadd -a words
}

zle -C tmux-pane-words-prefix   complete-word _generic
zle -C tmux-pane-words-anywhere complete-word _generic
bindkey '^T' tmux-pane-words-prefix
bindkey '^X^X' tmux-pane-words-anywhere
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' completer _tmux_pane_words
zstyle ':completion:tmux-pane-words-(prefix|anywhere):*' ignore-line current
zstyle ':completion:tmux-pane-words-anywhere:*' matcher-list 'b:=* m:{A-Za-z}={a-zA-Z}'
# }}}
