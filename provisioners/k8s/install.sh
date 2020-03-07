#!/bin/sh

sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

sudo curl -Lo /usr/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64
sudo chmod +x /usr/bin/kind

