#!/bin/sh

apt-get install -y golang-go
mkdir /home/vagrant/go
echo 'export GOPATH=/home/vagrant/go' >> /home/vagrant/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> /home/vagrant/.bashrc
