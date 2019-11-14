#!/bin/sh


sudo add-apt-repository ppa:longsleep/golang-backports
sudo apt-get update
sudo apt-get install -y golang-go

mkdir -p "$HOME/go"

once="$HOME/.once/golang-profile"
mkdir -p "$HOME/.once"
if [ ! -f "$once" ]; then
  echo "export GOPATH=$HOME/go" >> "$HOME/.bash_profile"
  echo "export PATH=\$PATH:\$GOPATH/bin" >> "$HOME/.bash_profile"
  touch "$once";
fi
. $HOME/.bash_profile
go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/vet
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/godoc
