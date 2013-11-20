#!/bin/bash

# Getting the directory where this script is stored
path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Going to user home directory
cd ~

# Removing files
rm -f .xinitrc .bashrc .bash_logout .bash_profile .vimrc .vim .gitconfig

# Removing files
ln -s $path/dotfiles/xinitrc .xinitrc
ln -s $path/dotfiles/bashrc_user.bash .bashrc
ln -s $path/dotfiles/bash_profile.bash .bash_profile
ln -s $path/dotfiles/bash_logout .bash_logout
ln -s $path/dotfiles/gitconfig .gitconfig
ln -s $path/dotfiles/vimrc .vimrc
ln -s $path/dotfiles/vim .vim


# 
