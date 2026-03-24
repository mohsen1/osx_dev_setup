#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Installing Homebrew..."
if ! command -v brew &>/dev/null; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    eval "$("$BREW_PREFIX/bin/brew" shellenv)"
else
    echo "    Homebrew already installed."
fi

echo "==> Installing formulae..."
brew install \
    git gh coreutils gnu-sed \
    fish tmux fzf fd bat ripgrep tree \
    neovim macvim vifm lazygit \
    diff-so-fancy git-filter-repo \
    rustup deno uv \
    docker docker-compose docker-completion \
    cloudflared tailscale azure-cli \
    ffmpeg yt-dlp cloc hyperfine ollama yek \
    2>&1 | grep -v "already installed" || true

echo "==> Installing casks..."
brew install --cask \
    orbstack visual-studio-code caffeine keycastr \
    font-source-code-pro-for-powerline gcloud-cli \
    2>&1 | grep -v "already installed" || true

echo "==> Launching OrbStack (provides Docker)..."
open -a OrbStack

echo "==> Brew setup complete."
