#!/bin/sh

sudo apt-get install -y virtualbox-guest-x11 xfce4 konsole thunar-archive-plugin

configtar="$HOME/configs/xfce/config.tar.gz"
once="$HOME/.once/xfce-bashprofile"
mkdir -p "$HOME/.once"
if [ ! -f "$once" ]; then
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.bash_profile"
  echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> "$HOME/.zprofile"
  wget --quiet "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip" -O /tmp/Hack.zip
  unzip /tmp/Hack.zip -d $HOME/.fonts/
  wget --quiet "https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Go-Mono.zip" -O /tmp/Go-Mono.zip
  unzip /tmp/Go-Mono.zip -d $HOME/.fonts/
  sudo fc-cache -fv

  touch "$once";
fi

if [ -f "$configtar" ]; then
  sudo tar -xzf "$configtar" -C / || echo "something went wrong, but it'll probably be ok"
  sudo chown -R vagrant:vagrant $HOME/.local
fi

sudo wget --quiet https://picsum.photos/1920/1200 -O /usr/share/backgrounds/xfce/xfce-blue.jpg
sudo wget --quiet https://picsum.photos/1920/1200 -O /usr/share/backgrounds/xfce/xfce-teal.jpg
sudo chmod 644 /usr/share/backgrounds/xfce/xfce-blue.jpg /usr/share/backgrounds/xfce/xfce-teal.jpg
