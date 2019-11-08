#!/bin/sh

nonce="$(head -c 10 /dev/urandom | base32)"
vagrant ssh -c "tar -C  / -cf '/tmp/config-$nonce.tar' \"/var/lib/samba/\";"
vagrant ssh -c "tar -C  / -rf '/tmp/config-$nonce.tar' \"/etc/samba/\";"
vagrant ssh -c "gzip '/tmp/config-$nonce.tar';"
vagrant scp "default:/tmp/config-$nonce.tar.gz" "$1"

