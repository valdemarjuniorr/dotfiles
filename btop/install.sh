#!/bin/bash

# Script to install btop and configure it using .dotfiles for Unix/Linux and macOS

set -e

install_on_linux() {
  # Try native package manager first
  if command -v dnf &>/dev/null; then
    sudo dnf install -y btop
  elif command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y btop
  elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm btop
  else
    # Fallback to binary install
    echo "No supported package manager found. Installing btop binary..."
    LATEST_URL=$(curl -s https://api.github.com/repos/aristocratos/btop/releases/latest | grep browser_download_url | grep linux64.tar | cut -d '"' -f 4)
    curl -LO "$LATEST_URL"
    tar -xf btop-*linux64.tar.* --strip-components=1
    sudo mv btop /usr/local/bin/
    rm -rf btop*tar.*
  fi
}

install_on_macos() {
  if command -v brew &>/dev/null; then
    brew install btop
  else
    echo "Homebrew not found. Please install Homebrew and re-run this script."
    exit 1
  fi
}

# Detect OS
OS="$(uname)"

if [[ "$OS" == "Linux" ]]; then
  install_on_linux
elif [[ "$OS" == "Darwin" ]]; then
  install_on_macos
else
  echo "Unsupported OS: $OS"
  exit 1
fi

# Create btop config directory
mkdir -p "$HOME/.config/btop"

# Symlink config from .dotfiles if exists
if [ -f "$HOME/.dotfiles/config/btop/btop.conf" ]; then
  ln -sf "$HOME/.dotfiles/config/btop/btop.conf" "$HOME/.config/btop/btop.conf"
else
  # Create a basic config if not present
  cat > "$HOME/.config/btop/btop.conf" <<EOF
# Example btop config, customize in ~/.dotfiles/config/btop/btop.conf
color_theme="gruvbox_dark"
update_ms=1000
EOF
fi

