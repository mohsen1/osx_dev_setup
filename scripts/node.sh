#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Setting up Node.js via Volta..."

if ! command -v volta &>/dev/null; then
    echo "    Installing Volta..."
    curl https://get.volta.sh | bash -s -- --skip-setup
else
    echo "    Volta already installed: $(volta --version)"
fi

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

echo "==> Installing Node.js..."
volta install node

echo "==> Installing pnpm..."
volta install pnpm

echo "==> Installing yarn..."
volta install yarn

echo "==> Node setup complete."
echo "    Node: $(node --version)"
echo "    pnpm: $(pnpm --version)"
