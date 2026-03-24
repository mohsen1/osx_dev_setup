#!/bin/bash
source "$(dirname "$0")/helpers.sh"

KEY_TYPE="ed25519"
KEY_FILE="$HOME/.ssh/id_$KEY_TYPE"
SSH_CONFIG="$HOME/.ssh/config"

echo "==> Setting up SSH..."

mkdir -p ~/.ssh
chmod 700 ~/.ssh

if [ -f "$KEY_FILE" ]; then
    echo "    SSH key already exists at $KEY_FILE"
    echo "    Fingerprint: $(ssh-keygen -lf "$KEY_FILE")"
else
    echo "    Generating Ed25519 SSH key..."
    ssh-keygen -t "$KEY_TYPE" -C "$GIT_USER_EMAIL" -f "$KEY_FILE" -N ""
    echo "    Key generated: $(ssh-keygen -lf "$KEY_FILE")"
fi

echo "==> Adding key to ssh-agent..."
ssh-add --apple-use-keychain "$KEY_FILE" 2>/dev/null || ssh-add "$KEY_FILE"

echo "==> Uploading SSH key to GitHub..."
if ! command -v gh &>/dev/null; then
    echo "    ERROR: gh CLI not installed. Run brew.sh first." >&2
    exit 1
fi

if ! gh auth status &>/dev/null; then
    echo "    Logging into GitHub..."
    gh auth login -p ssh -h github.com -w
fi

KEY_TITLE="$(hostname -s)-$(date +%Y%m%d)"
PUB_KEY="$(cat "${KEY_FILE}.pub")"

if gh ssh-key list 2>/dev/null | grep -qF "$(echo "$PUB_KEY" | awk '{print $2}')"; then
    echo "    SSH key already registered on GitHub."
else
    echo "    Adding key to GitHub as '$KEY_TITLE'..."
    gh ssh-key add "${KEY_FILE}.pub" --title "$KEY_TITLE" --type authentication
    echo "    SSH key added to GitHub."
fi

echo "==> Writing SSH config..."
backup_if_exists "$SSH_CONFIG"

cat > "$SSH_CONFIG" << SSHCONF
Host *
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_$KEY_TYPE
    ServerAliveInterval 60
    ServerAliveCountMax 3
    ConnectTimeout 10
    TCPKeepAlive yes

Host github.com
    HostName ssh.github.com
    Port 443
    User git
    ControlMaster no
    ControlPath none

Include ~/.orbstack/ssh/config
SSHCONF

chmod 600 "$SSH_CONFIG"

echo "==> Testing GitHub SSH connection..."
# ssh -T exits 1 even on success (GitHub rejects shell); tolerate that
if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
    echo "    GitHub SSH connection works!"
else
    echo "    WARNING: GitHub SSH test didn't get expected response."
    echo "    You may need to: gh auth login -p ssh"
fi

echo "==> SSH setup complete."
