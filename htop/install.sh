#!/bin/bash

# Script to install htop and configure it using .dotfiles for Unix/Linux and macOS

set -e

install_on_linux() {
  # Try native package manager
  if command -v dnf &>/dev/null; then
    sudo dnf install -y htop
  elif command -v apt &>/dev/null; then
    sudo apt update && sudo apt install -y htop
  elif command -v pacman &>/dev/null; then
    sudo pacman -Syu --noconfirm htop
  else
    echo "No supported package manager found. Please install htop manually."
    exit 1
  fi
}

install_on_macos() {
  if command -v brew &>/dev/null; then
    brew install htop
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

# Create htop config directory
mkdir -p "$HOME/.config/htop"

# Symlink config from .dotfiles if exists
if [ -f "$HOME/.dotfiles/htop/htoprc" ]; then
  ln -sf "$HOME/.dotfiles/htop/htoprc" "$HOME/.config/htop/htoprc"
else
  # Create a basic config if not present
  cat > "$HOME/.config/htop/htoprc" <<EOF
# Example htop config, customize in ~/.dotfiles/htop/htoprc
fields=0 48 17 18 38 39 2 46 47 49 1
sort_key=46
EOF
fi

