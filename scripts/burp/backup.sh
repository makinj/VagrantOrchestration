#!/bin/sh

nonce="$(head -c 10 /dev/urandom | base32)"
vagrant ssh -c "tar -C  / -czf '/tmp/bin-$nonce.tar.gz' \"\$HOME/BurpSuitePro/\";"
vagrant scp "default:/tmp/bin-$nonce.tar.gz" "$1"


