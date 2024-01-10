# OSX Development Setup

This is how I setup an OSX machine for devlopment. This is mainly a reminder for myself.


## Homebrew

Instal [Homebrew](brew.sh) 

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

```bash
brew install git
brew install fish
brew install macvim
brew install vifm
brew install gnu-sed
brew install gnupg
brew install yarn 
brew install fzf
brew install fd
brew install diff-so-fancy
brew install visual-studio-code
brew install --cask caffeine
```

Volta.sh

```
curl https://get.volta.sh | bash
source ~/.config/fish/config.fish
volta install node
volta intall yarn
```

## Fish

### Change the default shell to fish 
```
echo $(which fish) | sudo tee -a /etc/shells && chsh -s $(which fish)
```

#### Fish prompt

Install Fisher 

```
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

oh-my-fish

```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```

theme

```
omf install bobthefish
```

[`fzf`](https://github.com/junegunn/fzf)

```
fisher install PatrickF1/fzf.fish
```

[More awesome fish](https://github.com/bucaran/awesome-fish)

#### Install [Source Code Pro font](https://github.com/adobe-fonts/source-code-pro) for [Powerline](https://github.com/powerline/fonts) like a pro


```
brew tap homebrew/cask-fonts
brew install font-source-code-pro-for-powerline
```

### [QuickLook plugins](https://github.com/sindresorhus/quick-look-plugins):

``` bash
brew install qlcolorcode qlstephen qlmarkdown quicklook-json qlimagesize suspicious-package apparency quicklookase qlvideo
```

## Github
### Add public keys to Github

```
ssh-keygen -t rsa -b 4096 -C "me@azimi.me"
cat ~/.ssh/id_rsa.pub | pbcopy 
```
Add it [here](https://github.com/settings/ssh/new)

### Add PGP keys to Github
[Guide](https://help.github.com/articles/adding-a-new-gpg-key-to-your-github-account/)

### Update to proper Vim

```bash
$ curl -L https://bit.ly/janus-bootstrap | bash
```

### Git stuff

#### [Moved lines color](https://blog.github.com/2018-04-05-git-217-released/#coloring-moved-code)
```
git config --global diff.colorMoved zebra
```

#### Remove prefixes

```
git config --global diff.noprefix true
```

#### checkout pull requests
```
git config --global --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
```

#### Enable facy diff
```
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

#### Aliases
**A better `git l`**
```
git config --global alias.l "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```

#### Install `fzf.fish`

https://github.com/PatrickF1/fzf.fish


#### Use gitstatus 
https://github.com/romkatv/gitstatus
