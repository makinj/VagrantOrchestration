#!/bin/sh

apt-get install -y virtualbox-guest-x11 xfce4 konsole thunar-archive-plugin

once="$HOME/.once/xfce-bashprofile"
mkdir -p "$HOME/.once"
configtar="$HOME/configs/xfce/config.tar.gz"

#chmod +x "$HOME/scripts/xfce/*"

if [ ! -f "$once" ]; then
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.bash_profile"
  touch "$once";
fi

if [ -f "$configtar" ]; then
  tar -xzf "$configtar" -C /
fi
