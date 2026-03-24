#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Setting up Rust toolchain..."

ensure_command rustup rustup

if ! rustup show active-toolchain &>/dev/null 2>&1; then
    echo "    Installing stable toolchain..."
    rustup-init -y --default-toolchain stable --no-modify-path
else
    echo "    Rust toolchain already installed: $(rustup show active-toolchain)"
fi

echo "==> Installing Rust components..."
rustup component add rust-analyzer clippy rustfmt 2>/dev/null || true

echo "==> Installing cargo tools..."
ensure_command wasm-pack wasm-pack

echo "==> Rust setup complete."
