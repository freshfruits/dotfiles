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
	cp $HOME/.bashrc $HOME/Development/GitHub/dotfiles/desktop/.bashrc
	cp $HOME/.bash_aliases $HOME/Development/GitHub/dotfiles/desktop/.bash_aliases
	cp $HOME/.Xresources $HOME/Development/GitHub/dotfiles/desktop/.Xresources
	cp $HOME/.xinitrc $HOME/Development/GitHub/dotfiles/desktop/.xinitrc
	cp $HOME/.config/i3/config $HOME/Development/GitHub/dotfiles/desktop/.config/i3/config
	cp $HOME/.config/i3/i3blocks.conf $HOME/Development/GitHub/dotfiles/desktop/.config/i3blocks/i3blocks.conf
}

git_commit () {
	cd $HOME/Development/GitHub/dotfiles/
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
