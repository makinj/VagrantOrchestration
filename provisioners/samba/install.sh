#!/bin/sh

sudo apt-get -y install samba


configtar="$HOME/configs/samba/config.tar.gz"

if [ -f "$configtar" ]; then
  sudo tar -xzf "$configtar" -C /
fi

sudo cp $HOME/configs/samba/smb.conf /etc/samba/smb.conf
