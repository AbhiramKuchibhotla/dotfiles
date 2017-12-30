#!/bin/bash

curl -L git.io/antigen > /home/$USER/Git/antigen.zsh

for file in $(ls -a -I *sh -I *.md -I .git -I . -I .. -I .config)
do
    ln -s $(pwd)/$file $HOME/$file
done

ln -s $HOME/Git/dotfiles/.config/openbox $HOME/.config/openbox
ln -s $HOME/Git/dotfiles/.config/nvim $HOME/.config/nvim


echo "Installation Complete"
