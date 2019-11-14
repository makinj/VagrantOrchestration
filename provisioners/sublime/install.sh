#!/bin/sh

wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt-get install -y apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update
sudo apt-get install -y sublime-text

configtar="$HOME/configs/sublime/config.tar.gz"

if [ -f "$configtar" ]; then
  tar -xzf "$configtar" -C /
fi
