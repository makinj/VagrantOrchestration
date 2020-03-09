#!/bin/sh

sudo apt install -y zsh fonts-powerline


if [ ! -d "$HOME/.oh-my-zsh/" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  cp $HOME/configs/zsh/.zshrc ~/.zshrc 2>/dev/null || echo "didn't have a .gitconfig uploaded"
fi

sudo chsh -s $(which zsh) vagrant
