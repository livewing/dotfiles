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
