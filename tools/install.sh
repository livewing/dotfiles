#!/bin/bash

DOTPATH=~/dotfiles

for p in $DOTPATH/.??*; do
  f=$(basename $p)
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue

  ln -snfv "$p" "$HOME/$f"
done
