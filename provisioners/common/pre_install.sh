#!/bin/sh
resize2fs /dev/sda1
apt-get update
apt-get upgrade -y
apt-get install -y virtualbox-guest-additions-iso
#apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11 python git apt-transport-https virtualbox-guest-additions-iso
