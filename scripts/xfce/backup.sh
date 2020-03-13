#!/bin/sh

nonce="$(head -c 10 /dev/urandom | base32)"
vagrant ssh -c "sudo tar -C / -cf '/tmp/config-$nonce.tar' \
 \"\$HOME/.config/user-dirs.dirs\" \
  \"\$HOME/.config/user-dirs.locale\" \
  \"\$HOME/.config/xfce4\" \
  \"\$HOME/.config\" \
  \"\$HOME/.local/share/konsole\" \
  \"/usr/share/icons\" \
  \"/usr/share/themes\";"
vagrant ssh -c "sudo tar --no-recursion -rf '/tmp/config-$nonce.tar' \"\$HOME/.config/\";"
vagrant ssh -c "sudo tar --no-recursion -rf '/tmp/config-$nonce.tar' \"\$HOME/.local/share/\";"
vagrant ssh -c "sudo gzip '/tmp/config-$nonce.tar';sudo chown vagrant:vagrant '/tmp/config-$nonce.tar.gz'"
vagrant scp "default:/tmp/config-$nonce.tar.gz" "$1"




