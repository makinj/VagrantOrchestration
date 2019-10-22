#!/bin/sh

apt-get install -y xfce4 konsole thunar-archive-plugin


mkdir -p /home/vagrant/.config
tar -xzvf /home/vagrant/common/gui-config/config.tar.gz -C /

mkdir -p /usr/share/icons
tar -xzvf /home/vagrant/common/gui-config/icons.tar.gz -C  /

mkdir -p /usr/share/themes
tar -xzvf /home/vagrant/common/gui-config/themes.tar.gz -C /


echo 'if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then exec startx; fi' >> /home/vagrant/.bash_profile 
