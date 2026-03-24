#!/bin/bash
source "$(dirname "$0")/helpers.sh"

FISH_PATH="$(command -v fish)"

echo "==> Setting up Fish shell..."

if ! grep -qF "$FISH_PATH" /etc/shells; then
    echo "    Adding $FISH_PATH to /etc/shells (requires sudo)..."
    echo "$FISH_PATH" | sudo tee -a /etc/shells
fi

if [ "$SHELL" != "$FISH_PATH" ]; then
    echo "    Changing default shell to fish..."
    chsh -s "$FISH_PATH"
else
    echo "    Fish is already the default shell."
fi

echo "==> Installing Fisher..."
fish -c '
if not functions -q fisher
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source
    fisher install jorgebucaran/fisher
else
    echo "    Fisher already installed."
end
'

echo "==> Installing fish plugins..."
fish -c 'fisher install PatrickF1/fzf.fish'

echo "==> Installing Oh My Fish..."
if ! fish -c "type -q omf" 2>/dev/null; then
    curl -sL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish --init-command 'set argv --noninteractive'
fi

echo "==> Installing bobthefish theme..."
fish -c 'omf install bobthefish' 2>/dev/null || true

echo "==> Writing fish config..."
mkdir -p ~/.config/fish
backup_if_exists ~/.config/fish/config.fish

# Unquoted heredoc so $BREW_PREFIX and $HOME expand at write time.
# Fish-specific variables ($PATH, $PNPM_HOME) use backslash escaping.
cat > ~/.config/fish/config.fish << FISHCONF
eval ($BREW_PREFIX/bin/brew shellenv)

if status is-interactive
    fish_add_path $HOME/.volta/bin
    fish_add_path $HOME/.local/bin
    fish_add_path $HOME/.cargo/bin

    set -gx PNPM_HOME "\$HOME/Library/pnpm"
    fish_add_path --append -g \$PNPM_HOME
end

set -gx EDITOR nvim
set -gx VISUAL nvim
set -gx COLORTERM truecolor

alias vim nvim
alias vi nvim

source ~/.orbstack/shell/init2.fish 2>/dev/null; or true
source "\$HOME/.cargo/env.fish" 2>/dev/null; or true
FISHCONF

echo "==> Fish setup complete. Restart your terminal."
