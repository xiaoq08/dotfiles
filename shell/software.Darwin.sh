# require brew
export HOMEBREW_VERBOSE=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles

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

# [require code]
alias cwl="ls -l $WSPACE/dotfiles/code-workspace"
alias c.="code ."
cwc() {
	localFn=$WSPACE/dotfiles/code-workspace/$1.local.code-workspace
	fn=$WSPACE/dotfiles/code-workspace/$1.code-workspace
	if [ -f $localFn ];then
		echo "opening code workspace $localFn ..."
    	code $localFn
	else
		echo "opening code workspace $fn ..."
		code $fn
  	fi
}


# [require zsh & iTerm2], needs to change key mapping for command + <- & ->
bindkey "[D" backward-word
bindkey "[C" forward-word
bindkey "^[a" beginning-of-line
bindkey "^[e" end-of-line
