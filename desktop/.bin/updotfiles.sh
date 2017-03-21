#!/usr/bin/env bash

# Update dotfiles

clear
echo "======================="
echo "Jacob's dotfiles update"
echo "======================="

# Git dotfile folder

dotfiles () {
	echo "Copying over dotfiles"
	copy_dotfiles
	
	echo "Commiting Git"
	git_commit
}

copy_dotfiles () {
	cd $HOME
	cp ~/.bashrc ~/Development/GitHub/dotfiles/desktop/.bashrc
	cp ~/.bash_aliases ~/Development/GitHub/dotfiles/desktop/.bash_aliases
	cp ~/.Xresources ~/Development/GitHub/dotfiles/desktop/.Xresources
	cp ~/.xinitrc ~/Development/GitHub/dotfiles/desktop/.xinitrc
	cp ~/.config/i3/config ~/Development/GitHub/dotfiles/desktop/.config/i3/config
	cp ~/.config/i3/i3blocks.conf ~/Development/GitHub/dotfiles/desktop/.config/i3blocks/i3blocks.conf
}

git_commit () {
	cd ~/Development/GitHub/dotfiles/
	git add .
	git commit -m "AUTOMATIC : updated dotfiles"
	git push origin master
}

# Main call
if [ -z $1 ]
then
	dotfiles
else
	exit
fi
