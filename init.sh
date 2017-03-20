#!/usr/bin/env bash

# This script is mainly set for Arch_Linux but can be configured to suit any linux system.

clear
echo "======================="
echo "Jacob's Setup Script"
echo "======================="

configure () {
        echo "Updating System"
        update_system

        echo "Configurating Dotfiles"
        configure_setup

        echo "Reboot"
        reboot_sequence

}

update_system() {
        sudo pacman -Syu
}

configure_setup() {
       # Variables
       DIR_NAME='dotfiles'

	cd $HOME
	git clone https://github.com/freshfruits/dotfiles
	cp ~/dotfiles/desktop/.Xresources ~/.Xresources
	cp ~/dotfiles/desktop/.bashrc ~/.bashrc
	cp ~/dotfiles/desktop/.xinitrc ~/.xinitrc
	cp ~/dotfiles/desktop/.bash_aliases ~/.bash_aliases
	cp ~/dotfiles/desktop/.config/i3/config ~/.config/i3/.config
	cp ~/dotfiles/desktop/.config/i3blocks/i3blocks.conf ~/.config/i3/i3blocks.conf
	rm -fr $DIR_NAME
}

# Sleeps 10 seconds then reboot the system, just to make sure.
reboot_sequence() {
        sleep 10
        sudo reboot now
}

# Main call
if [ -z $1 ]
then
        configure
else
        exit
fi
