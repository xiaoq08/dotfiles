export WSPACE=$HOME'/workspace'
cw() {
	cd $WSPACE/$1
}
alias ccai="cw cc/src/github.com/caicloud"

# [require code]
alias cwl="ls -l $WSPACE/dotfiles/code-workspace"
alias c.="code ."
cwc() {
	fn=$WSPACE/dotfiles/code-workspace/$1.code-workspace
	echo "opening $fn ..."
	code $fn
}
# [require direnv]
eval "$(direnv hook $SHELLTYPE)"
