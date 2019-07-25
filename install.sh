#!/bin/bash

# Install neovim configuration.
#
mkdir -p ~/.config
ln -s $PWD/nvim ~/.config/nvim

ln -s $PWD/nvim/init.vim ~/.vimrc 
ln -s $PWD/nvim ~/.vimfiles

# Install git configuration.
#
# mklink /J %USERPROFILE%\.gitconfig dot.gitconfig
