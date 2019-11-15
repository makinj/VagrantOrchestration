#!/bin/sh

sudo apt-get -y install samba


configtar="$HOME/configs/smb/config.tar.gz"

if [ -f "$configtar" ]; then
  tar -xzf "$configtar" -C /
fi

sudo cp $HOME/configs/samba/smb.conf /etc/samba/smb.conf
