# macOS Development Setup

Automated setup for a macOS dev machine. Run individual scripts or everything at once.

## Quick Start (Fresh Machine)

```bash
# Install Xcode Command Line Tools first
xcode-select --install

# Clone and run
git clone https://github.com/mohsen1/osx_dev_setup.git
cd osx_dev_setup
chmod +x setup.sh scripts/*.sh
./setup.sh all
```

## Run Individual Scripts

```bash
./setup.sh brew        # Homebrew + formulae + casks
./setup.sh macos       # macOS system preferences
./setup.sh fish        # Fish shell + Fisher + bobthefish
./setup.sh git         # Git global config
./setup.sh ssh         # SSH keygen + GitHub upload via gh
./setup.sh node        # Volta + Node.js + pnpm + yarn
./setup.sh python      # uv + Python
./setup.sh rust        # Rustup + rust-analyzer + clippy
./setup.sh neovim      # Neovim + LazyVim + language extras
./setup.sh ai-tools    # Claude Code, Codex CLI, Ollama
```

Or combine: `./setup.sh brew git ssh`

---

## What Gets Installed

### Homebrew Packages

**Core tools:** git, gh, coreutils, gnu-sed, fzf, fd, bat, ripgrep, tree, tmux, cloc, hyperfine

**Editors:** neovim, macvim, vifm

**Languages & runtimes:**
- **Node.js** via [Volta](https://volta.sh) — pnpm, yarn
- **Rust** via [rustup](https://rustup.rs) — rust-analyzer, clippy, rustfmt, wasm-pack
- **Python** via [uv](https://docs.astral.sh/uv/) — fast package manager + Python installer
- **Deno** — TypeScript runtime

**Containers:** docker, docker-compose, [OrbStack](https://orbstack.dev)

**Cloud & networking:** cloudflared, tailscale, azure-cli, gcloud-cli

**AI tools:** [Claude Code](https://docs.anthropic.com/en/docs/claude-code), [Codex CLI](https://github.com/openai/codex), ollama

**Other:** diff-so-fancy, git-filter-repo, ffmpeg, yt-dlp, yek, caffeine, keycastr

### Shell: Fish + bobthefish

- [Fish shell](https://fishshell.com) as default shell
- [Fisher](https://github.com/jorgebucaran/fisher) plugin manager
- [fzf.fish](https://github.com/PatrickF1/fzf.fish) — fuzzy search for files, history, git
- [Oh My Fish](https://github.com/oh-my-fish/oh-my-fish) + [bobthefish](https://github.com/oh-my-fish/theme-bobthefish) theme
- [Source Code Pro for Powerline](https://github.com/powerline/fonts) font

### Git Config

- `diff-so-fancy` as pager with colored moved-line detection
- SSH hardening (timeout, keepalive)
- Aliases: `git l` (graph log), `git st`, `git co`
- Auto PR ref fetching (`git fetch` pulls PR branches)
- `push.autoSetupRemote` for easy branch pushing

### SSH

- **Ed25519** key generation (replaces RSA — shorter, faster, more secure)
- Automatic upload to GitHub via `gh ssh-key add`
- macOS Keychain integration (`AddKeysToAgent`, `UseKeychain`)
- GitHub SSH over port 443 (works on restrictive networks)
- Connectivity verification

### Neovim (LazyVim)

- [LazyVim](https://www.lazyvim.org) distribution — batteries-included Neovim config
- **LSP** via mason.nvim — auto-installs language servers
- **Completion** via blink.cmp — fast, fuzzy
- **Treesitter** — syntax highlighting, text objects
- **Telescope** — fuzzy file/grep/symbol search
- Pre-configured extras: TypeScript, Rust, Python, JSON, YAML, TOML, Markdown
- `vim`/`vi` aliased to `nvim` in fish

### macOS Defaults

- **Dock:** autohide, size 72, no recents, no launch animation
- **Finder:** show hidden files, all extensions, path bar, status bar, POSIX title path
- **Keyboard:** fast repeat (2/15), disable auto-correct/capitalize/smart quotes
- **Trackpad:** three-finger drag, tap to click
- **Screenshots:** save to `~/Screenshots`, PNG, no shadow
- **Misc:** no quarantine dialog, expand save/print panels, no .DS_Store on network/USB

---

## Post-Setup (Manual Steps)

These steps require a password or interactive input and must be done manually:

1. **Set fish as default shell:**
   ```bash
   echo /opt/homebrew/bin/fish | sudo tee -a /etc/shells
   chsh -s /opt/homebrew/bin/fish
   ```
2. **Upload SSH key to GitHub** (if the script couldn't due to missing scope):
   ```bash
   gh auth refresh -h github.com -s admin:public_key
   gh auth setup-git
   ```
3. **Restart terminal** to activate fish shell
4. **Run `nvim`** once — plugins auto-install on first launch
5. **Authenticate CLI tools:**
   ```bash
   claude          # follow prompts for Anthropic auth
   gh auth login   # if not done during SSH setup
   ```
6. **Set API keys** in `~/.config/fish/config.fish`:
   ```fish
   set -gx OPENAI_API_KEY "..."
   ```
7. **Download Codex desktop app** from [openai.com/index/codex](https://openai.com/index/codex/)
8. **Start Tailscale:** open the Tailscale menu bar app or `tailscale up`

## Customizing

Each script in `scripts/` is standalone and idempotent — safe to re-run. Edit them to match your preferences before running.
