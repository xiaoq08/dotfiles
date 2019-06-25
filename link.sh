#!/bin/sh

dotfiles=$(pwd)

# by uname
ln -s ${dotfiles}/shell/system.`uname`.sh ~/.systemrc
ln -s ${dotfiles}/shell/software.`uname`.sh ~/.softwarerc

# universal
ln -s ${dotfiles}/shell/workspace.sh ~/.workspacerc
ln -s ${dotfiles}/shell/dockerrc.sh ~/.dockerrc
ln -s ${dotfiles}/shell/aliases.sh ~/.aliasesrc

# bash
# deprecated

# zsh
ln -s ${dotfiles}/shell/zshrc.sh ~/.zshrc

ln -s ${dotfiles}/git/gitignore_global ~/.gitignore_globalrc
