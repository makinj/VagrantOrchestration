#!/bin/sh

sudo curl -Lo /usr/bin/kind https://github.com/kubernetes-sigs/kind/releases/download/v0.5.1/kind-$(uname)-amd64
sudo chmod +x /usr/bin/kind
