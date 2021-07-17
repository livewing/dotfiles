#!/usr/bin/env zsh

for pacman in paru yay; do
  if builtin command -v $pacman > /dev/null 2>&1; then
    break
  fi
done

updatenum=$({ checkupdates; $pacman -Qua } | wc -l)
case $updatenum in
  0) echo '<span foreground="lime">System is up to date</span>' ;;
  1) echo "<span foreground=\"orange\">$updatenum update available</span>" ;;
  *) echo "<span foreground=\"orange\">$updatenum updates available</span>" ;;
esac
