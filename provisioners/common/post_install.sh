#!/bin/sh
usermod -G vboxsf -a vagrant
apt-get update
apt-get upgrade -y
reboot
