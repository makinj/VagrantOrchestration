#!/bin/sh
cd /tmp
git clone https://github.com/LionSec/katoolin.git
cp katoolin/katoolin.py /usr/bin/katoolin
sudo chmod +x /usr/bin/katoolin
