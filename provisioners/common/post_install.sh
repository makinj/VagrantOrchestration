#!/bin/sh
sudo usermod -G vboxsf -a vagrant
sudo apt-get update
sudo apt-get upgrade -y --with-new-pkgs
sudo reboot

# echo '
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi
# ' >> ~/.bashrc
