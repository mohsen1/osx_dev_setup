#!/bin/bash
# Shared helpers for setup scripts. Source this at the top of each script:
#   source "$(dirname "$0")/helpers.sh"

set -euo pipefail

# Detect Homebrew prefix (arm64 vs Intel)
if [ -d "/opt/homebrew" ]; then
    BREW_PREFIX="/opt/homebrew"
else
    BREW_PREFIX="/usr/local"
fi

# Configurable identity (override via environment)
: "${GIT_USER_NAME:=Mohsen Azimi}"
: "${GIT_USER_EMAIL:=mohsen1@users.noreply.github.com}"

ensure_command() {
    local cmd="$1"
    local install_name="${2:-$1}"
    if ! command -v "$cmd" &>/dev/null; then
        echo "    Installing $install_name..."
        brew install "$install_name"
    else
        echo "    $install_name already installed."
    fi
}

backup_if_exists() {
    local path="$1"
    if [ -e "$path" ]; then
        local backup="${path}.bak.$(date +%Y%m%d%H%M%S)"
        echo "    Backing up $path -> $backup"
        mv "$path" "$backup"
    fi
}
