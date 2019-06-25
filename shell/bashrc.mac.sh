# [term]
export CLICOLOR=1
export LSCOLORS=gxfxcxdxbxegedabagacad
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export EDITOR=vim

function console_hints() {
	TIME_HINT='('$(date +%H:%M:%S)')'
	IP_HINT=' ('$(ifconfig | grep "inet " | grep -v 127.0.0. | awk '{ print $2 }')')'
	LANG_HINT=""
	if which rvm >/dev/null; then
		RVM_HINT=$(rvm current)
		LANG_HINT="$RVM_HINT;"$LANG_HINT
	fi
	if which go >/dev/null; then
		GO_HINT=$(go version | awk '{print $3}')
		LANG_HINT="$GO_HINT;"$LANG_HINT
	fi
	if [ -n "${VIRTUAL_ENV-}" ]; then
		PY_HINT=$(basename $VIRTUAL_ENV)
		PY_HINT=${PY_HINT//python/py}
		PY_HINT=${PY_HINT//-/}
		LANG_HINT="$PY_HINT-v;"$LANG_HINT
	else
		PY_HINT=$(python -V 2>&1)
		PY_HINT=${PY_HINT//Python/py}
		PY_HINT=${PY_HINT// /}
		LANG_HINT="$PY_HINT;"$LANG_HINT
	fi
	GIT_HINT=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/')
	echo $TIME_HINT$IP_HINT$GIT_HINT' '$(docker-env)' ('$LANG_HINT')'
}

docker-env() {
	if which docker >/dev/null; then
		if [[ "${DOCKER_ENV}" == "" ]]; then
			echo "(local)"
		else
			echo "(${DOCKER_ENV})"
		fi
	fi
}

RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$GREEN[\u@\h:\w]$YELLOW \$(console_hints) $NO_COLOUR\n[ \W ]\$ "

# [bash]
alias ..="cd .."
alias df="df -h"
alias du="du -h"
alias la='ls -alh'
alias ll='ls -lh'
alias rl="clear;source $HOME/.zshrc"

# [PATH]
export PATH="$PATH:$WSPACE/dotfiles/golib/bin:$HOME/Downloads"
