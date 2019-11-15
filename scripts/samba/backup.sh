#!/bin/sh

nonce="$(head -c 10 /dev/urandom | base32)"



vagrant ssh -c "sudo pdbedit -e smbpasswd:/tmp/users.backup.tdb;"
vagrant ssh -c "tar -C  / -cf '/tmp/config-$nonce.tar' \"/etc/samba/\";"
vagrant ssh -c "sudo tar -C  / -rf '/tmp/config-$nonce.tar' \"/tmp/users.backup.tdb\";"
#vagrant ssh -c "sudo tar -C  / -rf '/tmp/config-$nonce.tar' \"/var/lib/samba/\";"
vagrant ssh -c "gzip '/tmp/config-$nonce.tar';"
vagrant scp "default:/tmp/config-$nonce.tar.gz" "$1"


