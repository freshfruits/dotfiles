#!/usr/bin/env bash

# Terminal wipe
clear

# LOGO!
function logo() {
echo '			        Well.. Its something, isnt it?..  '

}

echo
echo
logo
echo
echo

# Be ready
echo
echo "Please be ready to click y or no"
echo

echo "Installing yaourt"
sudo pacman -S yaourt

echo "Installing git"
sudo pacman -S git

# DOTFILES Setup
echo "Beginning dotfiles setup"
mkdir ~/dotfiles
cd ~/dotfiles
git clone https://github.com/freshfruits/dotfiles
echo
echo "copying .Xresources"
cp ~/dotfiles/dotfiles/desktop/.Xresources ~/.Xresources
echo "copying .bashrc"
cp ~/dotfiles/dotfiles/desktop/.bashrc ~/.bashrc
echo "copying .xinitrc"
echo
cp ~/dotfiles/dotfiles/desktop/.xinitrc ~/.xinitrc

# Installing i3blocks
yaourt install i3blocks

# End of Dotfiles
echo
echo "Removing dotfiles folder"
echo
rm -fr ~/dotfiles

# EOF
echo 
echo
echo "EOF" 
echo "Thank you, please come again."
echo
echo
