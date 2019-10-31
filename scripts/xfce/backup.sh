#!/bin/sh

"$(dirname $0)/../common/backup.sh" \
  '"$HOME/.config/user-dirs.dirs" \\
  "$HOME/.config/user-dirs.locale" \\
  "$HOME/.config/xfce4" \\
  "/usr/share/icons" \\
  "/usr/share/themes"' \
  $1
