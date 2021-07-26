#!/usr/bin/env zsh

if [[ $# -eq 0 ]]; then
  echo Shutdown
  echo Reboot
  echo Logout
  exit 0
fi

case $1 in
  Shutdown) sudo shutdown -h now ;;
  Reboot) sudo reboot ;;
  Logout) i3-msg exit ;;
  *) echo error >&1 && exit 1 ;;
esac > /dev/null 2>&1
