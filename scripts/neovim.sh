#!/bin/bash
source "$(dirname "$0")/helpers.sh"

echo "==> Setting up Neovim with LazyVim..."

ensure_command nvim neovim
ensure_command lazygit lazygit

# Only clone LazyVim if no config exists
if [ -d ~/.config/nvim/lua/lazyvim ] || [ -d ~/.config/nvim/lua/plugins ]; then
    echo "    Neovim config already exists, skipping clone."
else
    for dir in ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do
        backup_if_exists "$dir"
    done

    echo "    Cloning LazyVim starter..."
    git clone https://github.com/LazyVim/starter ~/.config/nvim
    rm -rf ~/.config/nvim/.git
fi

mkdir -p ~/.config/nvim/lua/plugins

cat > ~/.config/nvim/lua/plugins/extras.lua << 'LUA'
return {
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.markdown" },
}
LUA

# Ensure POSIX shell is set (fish is not POSIX)
if ! grep -q 'vim.o.shell' ~/.config/nvim/lua/config/options.lua 2>/dev/null; then
    cat >> ~/.config/nvim/lua/config/options.lua << 'LUA'

vim.o.shell = "/bin/sh"
LUA
fi

echo "==> Neovim setup complete."
echo "    Run 'nvim' to trigger first-time plugin installation."
echo "    Use :Mason to install/manage LSP servers."
