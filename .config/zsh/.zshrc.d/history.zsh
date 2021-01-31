HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt extended_history
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_save_no_dups
setopt hist_expand
setopt inc_append_history
setopt share_history

fzf-history() {
  BUFFER=$(history -n 1 | fzf --tac --height=10 --prompt='History> ' --query="$BUFFER" || echo "$BUFFER")
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N fzf-history
bindkey '^R' fzf-history
