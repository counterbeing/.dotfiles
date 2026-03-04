#!/usr/bin/env bash
# Dotfiles installer — replaces the old Ruby bootstrap framework.
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==> Dotfiles installer"
echo "    Source: $DOTFILES_DIR"

###############################################################################
# 1. Homebrew
###############################################################################
if ! command -v brew &>/dev/null; then
  echo "==> Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

###############################################################################
# 2. Brew Bundle
###############################################################################
echo "==> Running brew bundle..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

###############################################################################
# 3. Symlink .link files
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
# 4. Oh My Zsh
###############################################################################
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "==> Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
  # oh-my-zsh replaces .zshrc; restore ours
  [ -f "$HOME/.zshrc.pre-oh-my-zsh" ] && mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc"
fi

###############################################################################
# 5. macOS preferences
###############################################################################
if [[ "$(uname)" == "Darwin" ]]; then
  echo "==> Setting macOS preferences..."
  bash "$DOTFILES_DIR/macos/defaults.sh"
fi

###############################################################################
# 6. iTerm2 plist
###############################################################################
if [ -f "$DOTFILES_DIR/plists/com.googlecode.iterm2.plist" ]; then
  echo "==> Copying iTerm2 preferences..."
  cp "$DOTFILES_DIR/plists/com.googlecode.iterm2.plist" \
     "$HOME/Library/Preferences/com.googlecode.iterm2.plist"
fi

###############################################################################
# 7. Xcode license
###############################################################################
if command -v xcodebuild &>/dev/null; then
  echo "==> Accepting Xcode license..."
  sudo xcodebuild -license accept 2>/dev/null || true
fi

###############################################################################
# 8. Claude Code
###############################################################################
echo "==> Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash

echo "==> Installing OpenAI Codex..."
npm install -g @openai/codex

###############################################################################
# 9. Git identity (per-machine)
###############################################################################
if [ ! -f "$HOME/.gitconfig.local" ]; then
  echo "==> Setting up Git identity for this machine..."
  echo "    (Stored in ~/.gitconfig.local — not tracked by the repo)"
  printf "    Name: "
  read -r git_name
  printf "    Email: "
  read -r git_email
  cat > "$HOME/.gitconfig.local" <<EOF
[user]
	name = $git_name
	email = $git_email
EOF
  echo "    Written to ~/.gitconfig.local"
else
  echo "==> Git identity already configured (~/.gitconfig.local exists)"
fi

###############################################################################
# 10. Neovim config
###############################################################################
echo "==> Setting up Neovim config..."
mkdir -p "$HOME/.config"
ln -sfn "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

###############################################################################
# 11. Ghostty config
###############################################################################
echo "==> Setting up Ghostty config..."
mkdir -p "$HOME/.config/ghostty"
ln -sfn "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"

###############################################################################
# 12. Dock layout
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
