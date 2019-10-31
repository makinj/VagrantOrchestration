#!/bin/sh
nonce=$(head -c 6 /dev/urandom | base64)
vagrant scp "$1" "default:/tmp/config-$nonce.tar.gz"
vagrant ssh -c "sudo tar -xzf '/tmp/config-$nonce.tar.gz' -C /"
