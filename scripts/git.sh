#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Configuring Git..."

git config --global user.name "$GIT_USER_NAME"
git config --global user.email "$GIT_USER_EMAIL"

git config --global diff.colorMoved zebra
git config --global diff.noprefix true
git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
git config --global core.sshCommand "ssh -o ConnectTimeout=10 -o ServerAliveInterval=60 -o ServerAliveCountMax=3"

git config --global alias.l "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global alias.st status
git config --global alias.co checkout

git config --global push.autoSetupRemote true
git config --global pull.rebase false
git config --global http.postBuffer 524288000

# Use --replace-all to avoid duplicates on re-run
git config --global --replace-all remote.origin.fetch "+refs/pull/*/head:refs/remotes/origin/pr/*"

git config --global protocol.file.allow always
git config --global submodule.allowSparseCheckout true

echo "==> Git configured."
