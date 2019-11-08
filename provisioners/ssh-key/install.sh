#!/bin/sh

cp $HOME/vault/ssh-key/* ~/.ssh 2>/dev/null || echo "didn't have an ssh key uploaded"
cp $HOME/config/ssh-key/.gitconfig ~/.gitconfig 2>/dev/null || echo "didn't have a .gitconfig uploaded"

