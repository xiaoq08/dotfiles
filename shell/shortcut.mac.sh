# require brew
export HOMEBREW_VERBOSE=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

# require git
gsync() {
	branch='develop'
	if [[ $1 ]]; then
		branch=$1
	fi
	echo "==> git stash"
	cur_branch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	stashed=$(git stash)
	echo $stashed
	echo "==> switch to branch=$branch, sync direction: upstream -> local -> origin"
	git checkout $branch
	git branch -vv | grep $branch
	git remote -v | grep -E "upstream|origin"
	echo "==> fetch from upstream && merge"
	git fetch upstream -p && git merge upstream/$branch
	echo "==> cleanup origin, push to origin"
	git fetch origin -p && git push origin
	echo "==> switch back branch=$cur_branch"
	git checkout $cur_branch
	if ! [[ $stashed == No* ]]; then
		echo "==> git stash pop"
		git stash pop
	fi
}
alias gsm='gsync master'
alias gbdd='git branch -D'

# require Ghostscript
shrinkpdf() {
	gs -q -dNOPAUSE -dBATCH -dSAFER \
		-sDEVICE=pdfwrite \
		-dCompatibilityLevel=1.3 \
		-dPDFSETTINGS=/screen \
		-dEmbedAllFonts=true \
		-dSubsetFonts=true \
		-dColorImageDownsampleType=/Bicubic \
		-dColorImageResolution=72 \
		-dGrayImageDownsampleType=/Bicubic \
		-dGrayImageResolution=72 \
		-dMonoImageDownsampleType=/Bicubic \
		-dMonoImageResolution=72 \
		-sOutputFile=out.pdf \
		$1
}

# require python
alias pj='python -m json.tool'
