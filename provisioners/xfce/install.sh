#!/bin/sh

apt-get install -y virtualbox-guest-x11 xfce4 konsole thunar-archive-plugin

once="$HOME/.once/xfce"
mkdir -p "$HOME/.once"
configtar="$HOME/configs/xfce/config.tar.gz"

#chmod +x "$HOME/scripts/xfce/*"

if [ ! -f "$once" ]; then
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.bash_profile"

  if [ -f "$configtar" ]; then
    $HOME/scripts/xfce/restore.sh "$configtar";
  fi

  touch "$once";
fi
