#!/usr/bin/env bash

# This script is mainly set for Arch_Linux but can be configured to suit any linux system.

clear
echo "======================="
echo "Jacob's Setup Script"
echo "======================="

configure () {
        echo "Updating System"
        update_system

        echo "Installing additional packages"
        install_packages

        echo "Installling AUR packages"
        install_aur_packages

        echo "Configurating Dotfiles"
        configure_setup

        echo "Reboot"
        reboot_sequence

}

update_system() {
        sudo pacman -Syu
}

install_packages() {
        local packages=''

        # Git packages
        packages+='git'

       sudo  pacman -S $packages
}

install_aur_packages() {
        local yaourt_packages=''

	# i3blocks
	yaourt_packages+='i3blocks'

	yaourt $yaourt_packages
}

configure_setup() {
       # Variables
       USR='~'
       DOTFILES='~/dotfiles/desktop'
       DIR_NAME='~/dotfiles'

	cd $USER_HOME
	git clone https://github.com/freshfruits/dotfiles
	cp $DOTFILES/.Xresources $USR/.Xresources
	cp $DOTFILES/.bashrc $USR/.bashrc
	cp $DOTFILES/.xinitrc $USR/.xinitrc
	cp $DOTFILES/.bash_aliases $USR/.bash_aliases
	cp $DOTFILES/.config/i3/config $USR/.config/i3/.config
	cp $DOTFILES/.config/i3blocks/i3blocks.conf $USR/.config/i3/i3blocks.conf
	cd $USER_HOME
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
