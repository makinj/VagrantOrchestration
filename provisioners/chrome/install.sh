#!/bin/sh
wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb 2>/dev/null
apt install -y /tmp/google-chrome-stable_current_amd64.deb
