#!/bin/bash

set -e

if [ ! -d ~/code/dotfiles ]; then
  echo "Cloning dotfiles"
  # the reason we dont't copy the files individually is, to easily push changes
  # if needed
  cd ~/code
  git clone --recursive https://github.com/latbauerdick/dotfiles
fi

cd ~/code/dotfiles
git remote set-url origin git@github.com:latbauerdick/dotfiles

ln -sf $(pwd)/vim/init.vim ~/.vimrc
mkdir -p ~/.config
ln -sf $(pwd)/vim ~/.config/nvim
# ln -sf $(pwd)/vim ~/.vim
ln -sf $(pwd)/zsh/zshrc ~/.zshrc
ln -sf $(pwd)/tmux/tmux.conf.ubuntu ~/.tmux.conf
##ln -s $(pwd)/tigrc ~/.tigrc
##ln -s $(pwd)/git-prompt.sh ~/.git-prompt.sh
ln -sf $(pwd)/git/gitconfig ~/.gitconfig
##ln -s $(pwd)/agignore ~/.agignore
ln -sf $(pwd)/ssh/sshconfig ~/.ssh/config

/usr/sbin/sshd -D
