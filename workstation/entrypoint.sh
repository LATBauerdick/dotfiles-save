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

ln -s $(pwd)/vim/init.vim ~/.vimrc
ln -sf $(pwd)/zsh/zshrc ~/.zshrc
ln -s $(pwd)/tmux/tmux.conf.ubuntu ~/.tmux.conf
##ln -s $(pwd)/tigrc ~/.tigrc
##ln -s $(pwd)/git-prompt.sh ~/.git-prompt.sh
ln -s $(pwd)/git/gitconfig ~/.gitconfig
##ln -s $(pwd)/agignore ~/.agignore
ln -s $(pwd)/ssh/sshconfig ~/.ssh/config


/usr/sbin/sshd -D
