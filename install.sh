#!/bin/bash

curl -L git.io/antigen > /home/$USER/Git/antigen.zsh

for file in $(ls -a -I *sh -I *.md -I .git -I . -I .. -I openbox)
do
    ln -s $(pwd)/$file $HOME/$file
done

ln -s $HOME/Git/dotfiles/openbox $HOME/.config/openbox

echo "Installation Complete"
