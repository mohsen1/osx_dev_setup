# OSX Development Setup

This is how I setup an OSX machine for devlopment. This is mainly a reminder for myself.


## Essensial Apps
* [Google Chrome](https://www.google.com/intl/en_us/chrome/browser/)
* [iTerm2](www.iterm2.com/)
* [Homebrew](brew.sh) `ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"`
* [Caffiene](http://lightheadsw.com/caffeine/)
* [Google Drive](https://tools.google.com/dlpage/drive/?hl=en)
* [Google Hangouts Chrome Plugin](https://www.google.com/tools/dlpage/hangoutplugin)
* [Google Hangouts Chrome extension](https://chrome.google.com/webstore/detail/hangouts/nckgahadagoaajjgafhacjanaoiihapd?utm_source=chrome-ntp-icon)
* [ShiftIt](https://code.google.com/p/shiftit/)
* [Sublime Text 3](http://www.sublimetext.com/3)
* XCode
* [Spotify](https://www.spotify.com/us/)

## CLI Essensials

```bash
brew install git node
brew install -g grunt-cli bower
brew install fish
brew install vim
brew install vifm
```
Install [QuickLook plugins](https://github.com/sindresorhus/quick-look-plugins)

``` bash
brew tap caskroom/cask
brew install brew-cask
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package
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

