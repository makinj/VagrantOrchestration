#!/bin/bash

# wget --quiet https://dl.google.com/go/go1.12.linux-amd64.tar.gz -O /tmp/
# sudo tar -C /usr/local -xzf /tmp/go1.12.linux-amd64.tar.gz


mkdir -p "$HOME/go"

once="$HOME/.once/golang-profile"
mkdir -p "$HOME/.once"
if [ ! -f "$once" ]; then
  sudo add-apt-repository ppa:longsleep/golang-backports
  echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" >> "$HOME/.zshrc"
  echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" >> "$HOME/.bash_profile"
  touch "$once";
fi

sudo apt-get update
sudo apt-get install -y golang-go

. $HOME/.bash_profile

go env -w GOPATH=$HOME/go

go get -u golang.org/x/tools/cmd/goimports
go get -u golang.org/x/tools/cmd/vet
go get -u golang.org/x/tools/cmd/oracle
go get -u golang.org/x/tools/cmd/godoc
