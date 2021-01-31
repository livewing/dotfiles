precmd_terminal_title() {
  builtin print -nP '\e]2;%n@%m:%~\a'
}
add-zsh-hook precmd precmd_terminal_title
