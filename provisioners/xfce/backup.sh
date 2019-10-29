#!/bin/sh
mkdir -p "$HOME/configs/xfce/"
tar -czf \
  "$HOME/configs/xfce/config.tar.gz" \
  "$HOME/.config/user-dirs.dirs" \
  "$HOME/.config/user-dirs.locale" \
  "$HOME/.config/xfce4" \
  /usr/share/icons \
  /usr/share/themes

