#!/bin/sh
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo apt install npm
sudo npm install -g truffle ganache-cli
cd ~
mkdir sc_tools
cd sc_tools
git clone git@gitlab.na.nccgroup.com:jmakinen1/truffle-static-analysis.git
git clone git@gitlab.na.nccgroup.com:jmakinen1/blockchain-scripts.git