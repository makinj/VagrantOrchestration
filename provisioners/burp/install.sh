#!/bin/sh

bintar="$HOME/configs/burp/bin.tar.gz"

if [ -f "$bintar" ]; then
  tar -xzf "$bintar" -C /
fi
