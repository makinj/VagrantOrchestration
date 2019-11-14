#!/bin/sh

sudo apt-get -y install samba

sudo cp $HOME/configs/samba/smb.conf /etc/samba/smb.conf
