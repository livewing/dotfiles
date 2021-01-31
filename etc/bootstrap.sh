#!/bin/sh

set -u

dotfiles_repository=gssequence/dotfiles.git

if ! command -v git > /dev/null 2>&1; then
  echo 'Git is not available, cannot proceed.'
  exit 1
fi

clone_ssh=0
no_restart_shell=0
while [ $# -gt 0 ]; do
  case "${1}" in
    --ssh)
      clone_ssh=1
      ;;
    --no-restart-shell)
      no_restart_shell=1
      ;;
    *)
      echo "Unrecognized option: ${1}"
      exit 1
      ;;
  esac
  shift
done

if [ $clone_ssh -eq 1 ]; then
  git clone git@github.com:$dotfiles_repository "$HOME/dotfiles" || exit $?
else
  git clone https://github.com/$dotfiles_repository "$HOME/dotfiles" || exit $?
fi

if [ $no_restart_shell -eq 1 ]; then
  "$HOME/dotfiles/bin/install-dotfiles" --no-restart-shell
else
  "$HOME/dotfiles/bin/install-dotfiles"
fi
