#!/bin/sh

apt install -y linux-modules-extra-$(uname -r) openjdk-8-jre ca-certificates apt-transport-https

echo 'deb http://www.ui.com/downloads/unifi/debian stable ubiquiti' | sudo tee /etc/apt/sources.list.d/100-ubnt-unifi.list
wget -O /etc/apt/trusted.gpg.d/unifi-repo.gpg https://dl.ui.com/unifi/unifi-repo.gpg
apt update

apt install -y unifi
cp $HOME/configs/unifi/60-unifieth.cfg /etc/network/interfaces.d/
