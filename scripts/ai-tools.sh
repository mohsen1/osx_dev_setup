#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Setting up AI development tools..."

export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

echo "==> Installing Claude Code CLI..."
if command -v claude &>/dev/null; then
    echo "    Claude Code already installed: $(claude --version 2>/dev/null || echo 'unknown')"
else
    npm install -g @anthropic-ai/claude-code
fi

echo "==> Installing Codex CLI..."
if command -v codex &>/dev/null; then
    echo "    Codex CLI already installed."
else
    npm install -g @openai/codex
fi

ensure_command ollama ollama

echo ""
echo "==> AI tools setup complete."
echo ""
echo "  Next steps:"
echo "    - Claude Code: run 'claude' and follow auth prompts"
echo "    - Codex CLI:   set OPENAI_API_KEY in your shell config"
echo "    - Codex App:   download from https://openai.com/index/codex/"
echo "    - Ollama:      run 'ollama serve' then 'ollama pull <model>'"
