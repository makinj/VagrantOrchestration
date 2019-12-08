#!/bin/sh
sudo usermod -G vboxsf -a vagrant
sudo apt-get update
sudo apt-get upgrade -y --with-new-pkgs
sudo reboot
