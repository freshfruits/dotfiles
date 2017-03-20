#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

#PS1='[\u@\h \W]\$ '

# GIT
source /usr/share/git/git-prompt.sh 

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1

export PS1='\[\e]0;\w\a\]\[\033[31m\][\[\033[0;92m\]\W\[\033[31m\]]\[\033[0;35m\]$(__git_ps1) \[\033[2;33m\]:\[\033[00m\] '

if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi

# Scripts
export PATH=$PATH:~/.bin
