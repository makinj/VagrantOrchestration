#!/bin/sh


add-apt-repository ppa:longsleep/golang-backports
apt-get update
apt-get install -y golang-go

mkdir "$HOME/go"

echo "export GOPATH=$HOME/go" >> "$HOME/.bashrc"
echo "export PATH=\$PATH:\$GOPATH/bin" >> "$HOME/.bashrc"
