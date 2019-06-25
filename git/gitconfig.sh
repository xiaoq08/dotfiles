#!/bin/sh
git config --global user.name xiaoqin
git config --global user.email xiaoq08@163.com

git config --global alias.tree "log --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %C(bold blue)<%an>%Creset %Cgreen(%cd)%Creset' --graph --date=short"
git config --global core.editor "code --wait"
git config --global core.excludesfile ~/.gitignore_globalrc
git config --global push.default simple
