#!/bin/sh

sudo resize2fs /dev/sda1
sudo apt-get update
sudo apt-get upgrade -y --with-new-pkgs
sudo apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils
sudo apt-get install -y python git vim apt-transport-https python-pip jq tmux zsh
sudo apt-get install -y linux-modules-extra-$(uname -r)
