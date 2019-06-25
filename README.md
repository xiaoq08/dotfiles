## Tools

### [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)

```
$ sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```

### [brew http://brew.sh/](http://brew.sh/)

```
$ cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core" && git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-core.git
$ cd "$(brew --repo)"/Library/Taps/homebrew/homebrew-cask && git remote set-url origin https://mirrors.ustc.edu.cn/homebrew-cask.git
$ cat ./tool/brew-leaves.txt | xargs -t -I {} brew install {}
# fix curl for cask (maybe proxychains4 need this?)
$ sudo mv /usr/bin/curl /usr/bin/curl.mac
$ sudo ln -s /usr/local/opt/curl/bin/curl /usr/bin/curl
# if failed use proxychains4
$ cat ./tool/brew-cask-list.txt | xargs -t -I {} brew cask install {}
```

#### minikube

```
curl -Lo minikube https://github.com/kubernetes/minikube/releases/download/v0.28.0/minikube-darwin-amd64 && chmod +x minikube && sudo mv minikube /usr/local/bin/
```

## Languages - go

```
$ cd golib
$ go get -u github.com/golang/dep/cmd/dep
$ go get -u github.com/alecthomas/gometalinter
$ gometalinter --install &> /dev/null
```

## Dotfiles

```
$ dotfiles=/Users/xiaoqin/workspace/dotfiles ./link.sh
# For VS Code
$ defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false
# For VS Code Insider
$ defaults write com.microsoft.VSCodeInsiders ApplePressAndHoldEnabled -bool false
```
