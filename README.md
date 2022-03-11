# OSX Development Setup

This is how I setup an OSX machine for devlopment. This is mainly a reminder for myself.


## Essensial Apps
* [Code](https://code.visualstudio.com)
* [iTerm2](http://www.iterm2.com/)
* [Homebrew](brew.sh) `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* [Caffiene](http://lightheadsw.com/caffeine/)
* [ShiftIt](https://code.google.com/p/shiftit/)
* XCode
* [Spotify](https://www.spotify.com/us/)


## CLI Essensials
* [fd](https://github.com/junegunn/fzf#respecting-gitignore)
* [Diff So Fancy](https://github.com/so-fancy/diff-so-fancy)
* [Oh my fish](https://github.com/oh-my-fish/oh-my-fish)
* [Powerline](https://github.com/oh-my-fish/theme-bobthefish)
* [More awesome fish](https://github.com/bucaran/awesome-fish)
* [FZF](https://github.com/junegunn/fzf)


```bash
brew install git
brew install fish
brew install vim
brew install vifm
brew install gnu-sed
brew install gnupg
brew install yarn 
brew install fzf
brew install fd
brew install diff-so-fancy 
```

### Change shell to fish 
```
sudo `which fish` >> /etc/shells
chsh -s `which fish`
```

https://github.com/PatrickF1/fzf.fish

### Install [Source Code Pro font](https://github.com/adobe-fonts/source-code-pro) for [Powerline](https://github.com/powerline/fonts) like a pro


```
brew tap caskroom/fonts
brew cask install font-source-code-pro-for-powerline
```

### [QuickLook plugins](https://github.com/sindresorhus/quick-look-plugins):

``` bash
brew tap caskroom/cask
brew install brew-cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
```

### VSCode
Add VSCode CLI function to `~/.config/fish/config.fish`:

```fish
function code
  open -a "Visual Studio Code.app" $argv
end
```

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
cd & cd Desktop
git clone git@github.com:mohsen1/.vim.git
cd .vim
make
cd .. & rm -rf .vim
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
