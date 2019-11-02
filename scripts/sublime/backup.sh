#!/bin/sh

nonce="$(head -c 10 /dev/urandom | base32)"
vagrant ssh -c "tar -C  / -cf '/tmp/config-$nonce.tar' \"\$HOME/.config/sublime-text-3/\";"
vagrant ssh -c "tar --no-recursion -rf '/tmp/config-$nonce.tar' \"\$HOME/.config/\";"
vagrant ssh -c "gzip '/tmp/config-$nonce.tar';"
vagrant scp "default:/tmp/config-$nonce.tar.gz" "$1"


