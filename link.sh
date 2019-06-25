#!/bin/sh

if [[ $dotfiles == "" ]]; then
	dotfiles=$(pwd)
fi

ln -s ${dotfiles}/shell/system.mac.sh ~/.systemrc
ln -s ${dotfiles}/shell/dockerrc.mac.sh ~/.dockerrc
ln -s ${dotfiles}/shell/workspace.mac.sh ~/.workspacerc
ln -s ${dotfiles}/shell/shortcut.mac.sh ~/.shortcutrc

# ln -s ${dotfiles}/shell/bashrc.mac.sh ~/.bashrc
# ln -s ${dotfiles}/bash_profile.mac.sh ~/.bash_profile

ln -s ${dotfiles}/zshrc.mac.sh ~/.zshrc

ln -s ${dotfiles}/git/gitconfig ~/.gitconfig
ln -s ${dotfiles}/git/gitignore_global ~/.gitignore_global
