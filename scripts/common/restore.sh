#!/bin/sh
nonce=$(head -c 5 /dev/urandom | base32)
vagrant scp "$1" "default:/tmp/config-$nonce.tar.gz"
vagrant ssh -c "sudo tar -xzf '/tmp/config-$nonce.tar.gz' -C /"
