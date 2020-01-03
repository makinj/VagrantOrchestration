#!/bin/sh

sudo usermod -G vboxsf -a vagrant
ln -fs /media/sf_project/ $HOME/project
sudo apt-get update
sudo apt-get upgrade -y --with-new-pkgs
sudo reboot
