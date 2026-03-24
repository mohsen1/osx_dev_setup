#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Setting up Python via uv..."

ensure_command uv uv

echo "==> Installing Python..."
uv python install

echo "==> Python setup complete."
echo "    Python: $(uv python list --installed | head -1)"
