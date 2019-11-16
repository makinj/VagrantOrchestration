#!/bin/sh
vagrant halt
vboxmanage clonemedium "$VagrantStorage/$1/$2" "$VagrantBackups/$1/$(date +%s)-$2"
vagrant up
