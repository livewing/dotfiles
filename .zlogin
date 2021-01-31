# Launch tmux
if [[ ! -n $TMUX && $- == *l* ]]; then
  command_list=$(cat <<-EOF
$(tmux list-sessions 2>/dev/null)
:n - New tmux session
:s - Start login shell (do not launch tmux)
:q - Logout <C-c>
EOF
)
  command_list=$(echo $command_list | sed -e '/^$/d')
  selected="$(echo $command_list | fzf)"
  fzf_status=$?

  if [[ $fzf_status -ne 0 ]]; then
    logout
  elif [[ $selected =~ ^:n ]]; then
    exec tmux new-session
  elif [[ $selected =~ ^:s ]]; then
    :
  elif [[ $selected =~ ^:q ]]; then
    logout
  else
    exec tmux attach -t "$(echo $selected | cut -d: -f1)"
  fi
fi
