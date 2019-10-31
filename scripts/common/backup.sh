#!/bin/sh
nonce="$(head -c 6 /dev/urandom | base64)"
vagrant ssh -c "sudo tar -czf '/tmp/config-$nonce.tar.gz' $1;"
vagrant scp "default:/tmp/config-$nonce.tar.gz" "$2"
