#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ALL_STEPS=(brew macos fish git ssh node python rust neovim ai-tools)

echo "╔══════════════════════════════════════════╗"
echo "║       macOS Development Setup            ║"
echo "╚══════════════════════════════════════════╝"
echo ""

run_script() {
    local name="$1"
    local script="$SCRIPT_DIR/scripts/$name.sh"
    if [ ! -f "$script" ]; then
        echo "ERROR: Script not found: $script" >&2
        exit 1
    fi
    echo ""
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Running: $name"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    bash "$script"
}

if [ $# -eq 0 ]; then
    echo "Usage:"
    echo "  ./setup.sh                  # show this help"
    echo "  ./setup.sh all              # run everything"
    echo "  ./setup.sh brew fish git    # run specific scripts"
    echo ""
    echo "Available scripts:"
    echo "  brew      Homebrew + formulae + casks"
    echo "  macos     macOS system preferences"
    echo "  fish      Fish shell + plugins + theme"
    echo "  git       Git global config"
    echo "  ssh       SSH key generation + GitHub upload"
    echo "  node      Volta + Node.js + pnpm"
    echo "  python    uv + Python"
    echo "  rust      Rustup + components"
    echo "  neovim    Neovim + LazyVim + language extras"
    echo "  ai-tools  Claude Code, Codex CLI, Ollama"
    echo ""
    echo "Recommended order for a fresh machine:"
    echo "  ./setup.sh all"
    exit 0
fi

# Expand "all" to the full step list
if [ "$1" = "all" ]; then
    set -- "${ALL_STEPS[@]}"
fi

for arg in "$@"; do
    run_script "$arg"
done

echo ""
echo "╔══════════════════════════════════════════╗"
echo "║       Setup complete!                    ║"
echo "╚══════════════════════════════════════════╝"
echo ""
echo "Next steps:"
echo "  1. Restart your terminal (fish shell)"
echo "  2. Run 'nvim' to install Neovim plugins"
echo "  3. Run 'claude' to authenticate Claude Code"
echo "  4. Set OPENAI_API_KEY for Codex CLI"
echo ""
