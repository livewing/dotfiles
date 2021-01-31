# vcs_info
precmd_vcs_info() {
  vcs_info
}
add-zsh-hook precmd precmd_vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '%F{40}+%f'
zstyle ':vcs_info:git:*' unstagedstr '%F{9}!%f'
zstyle ':vcs_info:git:*' formats '%K{33} %b%c%u %k'
zstyle ':vcs_info:git:*' actionformats '%K{33} %b%c%u %k%K{196} %a %k'

# prompt
MY_PROMPT='%K{%(!.171.27)} %~ %k'             # pwd
MY_PROMPT=$MY_PROMPT'${vcs_info_msg_0_}'      # vcs_info
MY_PROMPT=$MY_PROMPT'%(?..%K{160} \$?=%? %k)' # status code
MY_PROMPT=$MY_PROMPT' '                       # margin

# vi-mode status
terminfo_down_sc=$terminfo[cud1]$terminfo[cuu1]$terminfo[sc]$terminfo[cud1]
preexec_left_down_prompt() {
  print -rn -- $terminfo[el]
}
add-zsh-hook preexec preexec_left_down_prompt
function zle-keymap-select zle-line-init zle-line-finish
{
  case $KEYMAP in
    main|viins)
      PROMPT_2='%F{14}%B-- INSERT --%b%f'
      echo -ne '\e[6 q'
      ;;
    vicmd)
      PROMPT_2='%B-- NORMAL --%b'
      echo -ne '\e[2 q'
      ;;
  esac

  PROMPT="%{$terminfo_down_sc$PROMPT_2$terminfo[rc]%}"$MY_PROMPT
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select
zle -N edit-command-line

set_block_cursor() {
  echo -ne '\e[2 q'
}
add-zsh-hook preexec set_block_cursor
add-zsh-hook zshexit set_block_cursor

# other prompts
PROMPT2=' %K{%(!.171.27)} %_ %k '
RPROMPT='%K{240} %n@%m %k'
SPROMPT='zsh: correct %F{196}%B%R%b%f -> %F{45}%B%r%b%f? [(n)o, (y)es, (a)bort, (e)dit]: '

# misc
KEYTIMEOUT=1
REPORTTIME=3
TIMEFMT='----- time report -----
command: %J
    cpu: %P
 memory: %M KB
   real: %*E
   user: %*U
    sys: %*S'
ZLE_RPROMPT_INDENT=0
