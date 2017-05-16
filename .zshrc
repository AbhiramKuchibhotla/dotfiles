source /usr/share/zsh/share/antigen.zsh
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abhiram/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

#Antigen Stuff

# test load the oh-my-zsh library
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme minimal

# Tell antigen that you're done.
antigen apply

#Exports
export TERM="xterm-256color"
export EDITOR="vim"

#Aliases
alias screenfetch='screenfetch -D Arch'
alias neofetch='neofetch --disable title'
