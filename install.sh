#!/usr/bin/env bash
# Dotfiles installer — run on a fresh Mac to get everything set up.
#
# One-liner:
#   curl -fsSL https://raw.githubusercontent.com/counterbeing/.dotfiles/master/install.sh | bash
#
set -euo pipefail

DOTFILES_DIR="$HOME/.dotfiles"

echo "==> Dotfiles installer"
echo ""

###############################################################################
# Collect all input upfront so the rest runs unattended
###############################################################################
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "    We need a few details for this machine's git identity."
  echo "    (Stored in ~/.gitconfig.local — not tracked by the repo)"
  echo ""
  printf "    Full name (e.g. 'Cory Logan'): "
  read -r GIT_NAME < /dev/tty
  printf "    Email (e.g. 'you@example.com'): "
  read -r GIT_EMAIL < /dev/tty
  printf "    SSH signing key (from 1Password, e.g. 'ssh-ed25519 AAAA...'): "
  read -r GIT_SIGNINGKEY < /dev/tty
  echo ""
fi

# Cache sudo password upfront (needed for Xcode license)
echo "==> You may be prompted for your sudo password..."
sudo -v
# Keep sudo alive for the duration of the script
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# 0. Xcode Command Line Tools
###############################################################################
if ! xcode-select -p &>/dev/null; then
  echo "==> Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "    Waiting for installation to complete..."
  until xcode-select -p &>/dev/null; do sleep 5; done
fi

###############################################################################
# 1. Clone dotfiles repo (if not already present)
###############################################################################
if [ ! -d "$DOTFILES_DIR" ]; then
  echo "==> Cloning dotfiles..."
  git clone https://github.com/counterbeing/.dotfiles "$DOTFILES_DIR"
fi
cd "$DOTFILES_DIR"
echo "    Source: $DOTFILES_DIR"

###############################################################################
# 2. Homebrew
###############################################################################
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

###############################################################################
# 3. Brew Bundle
###############################################################################
echo "==> Running brew bundle..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

###############################################################################
# 4. Oh My Zsh (before symlinking so it doesn't clobber our zshrc)
###############################################################################
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  # oh-my-zsh creates a default .zshrc; remove it so our symlink takes over
  rm -f "$HOME/.zshrc"
fi

###############################################################################
# 5. Symlink .link files
###############################################################################
echo "==> Symlinking dotfiles..."
for src in "$DOTFILES_DIR"/links/*.link; do
  filename="$(basename "$src" .link)"
  dest="$HOME/.$filename"

  # Back up existing non-symlink files
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "    Backing up $dest -> ${dest}.backup"
    mv "$dest" "${dest}.backup"
  fi

  ln -sfn "$src" "$dest"
  echo "    $dest -> $src"
done

###############################################################################
# 6. macOS preferences
###############################################################################
if [[ "$(uname)" == "Darwin" ]]; then
  echo "==> Setting macOS preferences..."
  bash "$DOTFILES_DIR/macos/defaults.sh"
fi

###############################################################################
# 7. iTerm2 plist
###############################################################################
if [ -f "$DOTFILES_DIR/plists/com.googlecode.iterm2.plist" ]; then
  echo "==> Copying iTerm2 preferences..."
  cp "$DOTFILES_DIR/plists/com.googlecode.iterm2.plist" \
     "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
fi

###############################################################################
# 8. Xcode license
###############################################################################
if command -v xcodebuild &>/dev/null; then
  echo "==> Accepting Xcode license..."
  sudo xcodebuild -license accept 2>/dev/null || true
fi

###############################################################################
# 9. Claude Code & OpenAI Codex
###############################################################################
echo "==> Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash

echo "==> Installing OpenAI Codex..."
eval "$(/opt/homebrew/bin/brew shellenv)"
npm install -g @openai/codex

###############################################################################
# 10. Git identity (per-machine)
###############################################################################
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "==> Writing git identity to ~/.gitconfig.local..."
  cat > "$HOME/.gitconfig.local" <<EOF
[user]
	name = $GIT_NAME
	email = $GIT_EMAIL
	signingkey = $GIT_SIGNINGKEY
EOF
else
  echo "==> Git identity already configured (~/.gitconfig.local exists)"
fi

###############################################################################
# 11. 1Password SSH agent
###############################################################################
echo "==> Configuring 1Password SSH agent..."
mkdir -p "$HOME/.config/1Password/ssh"
if [ ! -f "$HOME/.config/1Password/ssh/agent.toml" ]; then
  cat > "$HOME/.config/1Password/ssh/agent.toml" <<'EOF'
# 1Password SSH agent config
# https://developer.1password.com/docs/ssh/agent/config
[[ssh-keys]]
# Allow all keys from 1Password vaults
EOF
fi

# Ensure SSH config includes the 1Password agent socket
OP_AGENT_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
SSH_CONFIG="$HOME/.ssh/config"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
if ! grep -q "IdentityAgent.*1password" "$SSH_CONFIG" 2>/dev/null; then
  printf '\nHost *\n  IdentityAgent "%s"\n' "$OP_AGENT_SOCK" >> "$SSH_CONFIG"
  echo "    Added 1Password agent to ~/.ssh/config"
fi

###############################################################################
# 12. Neovim config
###############################################################################
echo "==> Setting up Neovim config..."
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

###############################################################################
# 13. Ghostty config
###############################################################################
echo "==> Setting up Ghostty config..."
mkdir -p "$HOME/.config/ghostty"
ln -sfn "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

###############################################################################
# 14. Dock layout
###############################################################################
if command -v dockutil &>/dev/null; then
  # Only set up default Dock if it hasn't been customized (still has default Apple apps)
  if dockutil --list | grep -q "com.apple.launchpad.launcher" 2>/dev/null; then
    echo "==> Setting up Dock (default layout)..."
    dockutil --remove all --no-restart
    dockutil --add /Applications/Ghostty.app --no-restart
    dockutil --add /Applications/Helium.app --no-restart
    killall Dock
  else
    echo "==> Dock appears customized, skipping"
  fi
fi

###############################################################################
# Done
###############################################################################
echo ""
echo "==> All done! Open a new terminal to pick up changes."
echo "    Remember to enable 'SSH Agent' in 1Password > Settings > Developer"
