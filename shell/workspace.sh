case `uname` in
  Darwin)
	export WSPACE=$HOME'/workspace'
  ;;
  Linux)
	export WSPACE=$HOME
  ;;
esac

cw() {
	cd $WSPACE/$1
}

# [require direnv]
eval "$(direnv hook $SHELLTYPE)"
