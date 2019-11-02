#!/bin/sh

nonce="$(head -c 10 /dev/urandom | base32)"
vagrant ssh -c "tar -C / -cf '/tmp/config-$nonce.tar' \
 \"\$HOME/.config/user-dirs.dirs\" \
  \"\$HOME/.config/user-dirs.locale\" \
  \"\$HOME/.config/xfce4\" \
  \"\$HOME/.config\" \
  \"/usr/share/icons\" \
  \"/usr/share/themes\";"
vagrant ssh -c "tar --no-recursion -rf '/tmp/config-$nonce.tar' \"\$HOME/.config/\";"
vagrant ssh -c "gzip '/tmp/config-$nonce.tar'"
vagrant scp "default:/tmp/config-$nonce.tar.gz" "$1"


