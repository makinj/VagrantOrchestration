#!/bin/sh

apt-get install -y virtualbox-guest-x11 xfce4 konsole thunar-archive-plugin

home="/home/vagrant"
once="$home/.once/xfce"

configtar="$home/configs/xfce/config.tar.gz"

if [ -n -f "$once" ]; then
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$home/.bash_profile"

  if [ -f "$configtar" ]; then
    $home/scripts/xfce/restore.sh "$configtar";
  fi

  touch oncefile;
fi
