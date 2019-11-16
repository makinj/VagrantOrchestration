#!/bin/sh
vagrant halt
vboxmanage clonemedium "$VagrantBackups/$1/$2" "$VagrantStorage/$1/$3" ||
vboxmanage clonemedium "$VagrantBackups/$1/$2" "$VagrantStorage/$1/$3" --existing
vagrant up
