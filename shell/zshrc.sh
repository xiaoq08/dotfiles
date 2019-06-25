export ZSH="$HOME/.oh-my-zsh"
export SHELLTYPE="zsh"

plugins=(
  git
)

ZSH_THEME="robbyrussell" && source $ZSH/oh-my-zsh.sh

alias rl="clear;source $HOME/.zshrc"

# read preset envs
for fn (.systemrc .dockerrc .workspacerc .aliasesrc .softwarerc)
do
  if [ -f $HOME/$fn ];then
    source $HOME/$fn
  fi
done

# read local envs
setopt +o nomatch
for fn in $HOME/.*.local
do
  if [ -f $fn ];then
    source $fn
  fi
done

export PATH="$PATH:$WSPACE/dotfiles/golib/bin"

case `uname` in
  Darwin)
    export PATH="$PATH:$HOME/Downloads"
  ;;
  Linux)
    PROMPT="%{$fg[white]%}%n@%{$fg[green]%}%m%{$reset_color%} ${PROMPT}"
  ;;
esac
