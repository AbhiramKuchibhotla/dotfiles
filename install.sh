#!/bin/sh
RPMPKGS="git tmux zsh mc stow python-psutil"

# Crude multi-os installation option
if [ -x "/usr/bin/dnf" ]
then
   sudo dnf install -y $RPMPKGS
elif [ -x "/usr/bin/yum" ]
then
   sudo yum install -y $RPMPKGS
fi

# Add missing directory layout
if [ ! -d "~/.config" ]
then
  mkdir -p ~/.config
fi

mkdir -p ~/.local/bin

# Personal dotfiles
git clone https://github.com/AxelSilverdew/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
git submodule init
git submodule update

# stow the configurations
stow emacs
stow home
stow mpd
stow ncmpcpp
stow nvim
stow openbox
stow themes
stow tmux
stow vim
stow zsh

