# require git
# this only works for github fork
gsync_github() {
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

gsync_gitlab() {
	branch='develop'
	if [[ $1 ]]; then
		branch=$1
	fi
	echo "==> git stash"
	cur_branch=$(git branch 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
	stashed=$(git stash)
	echo $stashed
	echo "==> switch to branch=$branch, sync direction: origin -> local (no upstream)"
	git checkout $branch
	git branch -vv | grep $branch
	git remote -v | grep -E "upstream|origin"
	echo "==> fetch from origin && merge"
	git fetch origin -p && git merge origin/$branch
	echo "==> switch back branch=$cur_branch"
	git checkout $cur_branch
	if ! [[ $stashed == No* ]]; then
		echo "==> git stash pop"
		git stash pop
	fi
}

alias gsm='gsync_gitlab master'
alias gbdd='git branch -D'

# require python
alias pj='python -m json.tool'
