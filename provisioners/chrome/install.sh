#!/bin/sh

once="$HOME/.once/chrome-install"
mkdir -p "$HOME/.once"
if [ ! -f "$once" ]; then
  wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb 2>/dev/null
  sudo apt install -y /tmp/google-chrome-stable_current_amd64.deb
  touch $once
fi
