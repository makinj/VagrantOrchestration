#!/bin/sh

sudo apt-get install -y virtualbox-guest-x11 xfce4 konsole thunar-archive-plugin

configtar="$HOME/configs/xfce/config.tar.gz"

#chmod +x "$HOME/scripts/xfce/*"

once="$HOME/.once/xfce-bashprofile"
mkdir -p "$HOME/.once"
if [ ! -f "$once" ]; then
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.bash_profile"
  touch "$once";
fi
sudo wget --quiet https://picsum.photos/1920/1200 -O /usr/share/backgrounds/xfce/xfce-blue.jpg
sudo chmod 644 /usr/share/backgrounds/xfce/xfce-blue.jpg

if [ -f "$configtar" ]; then
  sudo tar -xzf "$configtar" -C /
fi
