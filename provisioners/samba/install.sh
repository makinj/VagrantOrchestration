#!/bin/sh

apt-get -y install samba

cp $HOME/configs/samba/smb.conf /etc/samba/smb.conf
