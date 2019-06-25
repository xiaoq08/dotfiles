export ZSH="$HOME/.oh-my-zsh"
export SHELLTYPE="zsh"
export PATH="$PATH:$WSPACE/dotfiles/golib/bin:$HOME/Downloads"

plugins=(
  git
)

ZSH_THEME="robbyrussell" && source $ZSH/oh-my-zsh.sh

alias rl="clear;source $HOME/.zshrc"

for fn (.systemrc .dockerrc .workspacerc .shortcutrc)
do
  if [ -f $HOME/$fn ];then
    source $HOME/$fn
  fi
done


