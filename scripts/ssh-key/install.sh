#!/bin/sh
mod=ssh-key
nonce="$(head -c 10 /dev/urandom | base32)"

tgt_keys="$1"
[ -z "$tgt_keys" ] && echo -e "Usage: $0 <tgt_keys>\nTell me what keys to use" && exit

zip -rj "$nonce.zip" "/cygdrive/c/$VagrantVault/$mod/$tgt_keys"

vagrant ssh -c "mkdir -p \"\$HOME/vault/$mod/\""
vagrant scp "$nonce.zip" "default:/home/vagrant/vault/$mod/$tgt_keys.zip"
vagrant ssh -c "unzip \"\$HOME/vault/$mod/$tgt_keys.zip\" -d ~/.ssh/"

#rm "$nonce.zip"
