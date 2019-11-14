#!/bin/sh
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt install npm
sudo npm install -g truffle ganache-cli
