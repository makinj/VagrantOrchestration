#!/bin/sh
resize2fs /dev/sda1
apt-get update
apt-get upgrade -y
apt-get install -y virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-additions-iso
apt-get install -y python git vim apt-transport-https
