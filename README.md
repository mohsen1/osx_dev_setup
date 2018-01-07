# OSX Development Setup

This is how I setup an OSX machine for devlopment. This is mainly a reminder for myself.


## Essensial Apps
* [Code](https://code.visualstudio.com)
* [iTerm2](http://www.iterm2.com/)
* [Homebrew](brew.sh) `ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"`
* [Caffiene](http://lightheadsw.com/caffeine/)
* [ShiftIt](https://code.google.com/p/shiftit/)
* [Sublime Text 3](http://www.sublimetext.com/3)
* XCode
* [Spotify](https://www.spotify.com/us/)


## CLI Essensials

```bash
brew install git
brew install fish
brew install vim
brew install vifm
brew install gnu-sed
brww install gnupg
brww install yarn 
brew install fzf
brew install fd
brew install diff-so-fancy 
```

Change shell to fish 
```
sudo `which fish` >> /etc/shells
chsh -s `which fish`
```

[fd](https://github.com/junegunn/fzf#respecting-gitignore)

[Diff So Fancy](https://github.com/so-fancy/diff-so-fancy)

[Oh my fish](https://github.com/oh-my-fish/oh-my-fish)

[Powerline](https://github.com/oh-my-fish/theme-bobthefish)

[Source Code Pro font](https://github.com/adobe-fonts/source-code-pro)

[Powerline fonts](https://github.com/powerline/fonts)

[More awesome fish](https://github.com/bucaran/awesome-fish)

[FZF](https://github.com/junegunn/fzf)

[QuickLook plugins](https://github.com/sindresorhus/quick-look-plugins):

``` bash
brew tap caskroom/cask
brew install brew-cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
```

Add VSCode CLI function to `~/.config/fish/config.fish`:

```fish
function code
  open -a "Visual Studio Code.app" $argv
end
```
### Add public keys to Github

### Update `.vim`

```bash
cd & cd Desktop
git clone git@github.com:mohsen1/.vim.git
cd .git
make
cd .. & rm -rf .vim
```

### Git stuff

```
# checkout pull requests
git config --global --add remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"
```

*A better `git l`*
```
git config --global alias.l "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```
