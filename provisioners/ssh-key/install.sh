#!/bin/sh

sudo ln $HOME/vault/ssh-key/id_rsa ~/.ssh/id_rsa 2>/dev/null || echo "Error linking ssh key"
#chmod -R 600 ~/.ssh/* 2>/dev/null|| echo "failed setting key permissions"
cp $HOME/configs/ssh-key/.gitconfig ~/.gitconfig 2>/dev/null || echo "didn't have a .gitconfig uploaded"

