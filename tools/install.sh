#!/bin/bash

DOTPATH=~/dotfiles

for p in $DOTPATH/.??*; do
  f=$(basename $p)
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  if [[ "$f" == ".config" ]] ; then
    if [[ ! -e "$HOME/.config" ]]; then
      mkdir "$HOME/.config"
    fi
    for pp in $p/*; do
      ff=$(basename $pp)
      ln -snfv "$pp" "$HOME/.config/$ff"
    done
    continue
  fi

  ln -snfv "$p" "$HOME/$f"
done

if [ ! -e "$HOME/.gitconfig.local" ]; then
    echo Git user configuration
    echo -n "Name: "
    read git_user_name
    echo -n "Email address: "
    read git_user_email
    echo "[user]" > .gitconfig.local
    echo -e "\tname = $git_user_name" >> .gitconfig.local
    echo -e "\temail = $git_user_email" >> .gitconfig.local
fi
