#!/bin/sh

sudo apt-get install -y virtualbox-guest-x11 xfce4 konsole thunar-archive-plugin

configtar="$HOME/configs/xfce/config.tar.gz"

once="$HOME/.once/xfce-bashprofile"
mkdir -p "$HOME/.once"
if [ ! -f "$once" ]; then
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.bash_profile"
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.zprofile"
  touch "$once";
fi

if [ -f "$configtar" ]; then
  sudo tar -xzf "$configtar" -C / || echo "something went wrong, but it'll probably be ok"
fi

sudo wget --quiet https://picsum.photos/1920/1200 -O /usr/share/backgrounds/xfce/xfce-blue.jpg
sudo wget --quiet https://picsum.photos/1920/1200 -O /usr/share/backgrounds/xfce/xfce-teal.jpg
sudo chmod 644 /usr/share/backgrounds/xfce/xfce-blue.jpg /usr/share/backgrounds/xfce/xfce-teal.jpg
