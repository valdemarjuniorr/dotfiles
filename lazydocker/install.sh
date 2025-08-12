#!/bin/bash

# Script to install lazydocker and configure it with .dotfiles on Fedora
source "$HOME/.dotfiles/scripts/bootstrap.sh"

# Install lazydocker via dnf (if available) or fallback to binary install
if dnf list lazydocker &>/dev/null; then
  sudo dnf install -y lazydocker
else
  info "lazydocker not available in dnf, downloading binary..."
  LAZYDOCKER_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazydocker/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')
  curl -Lo lazydocker.tar.gz "https://github.com/jesseduffield/lazydocker/releases/download/${LAZYDOCKER_VERSION}/lazydocker_${LAZYDOCKER_VERSION#v}_Linux_x86_64.tar.gz"
  tar -xzf lazydocker.tar.gz lazydocker
  sudo mv lazydocker /usr/local/bin/
  rm lazydocker.tar.gz
fi

# Create lazydocker config directory
mkdir -p "$HOME/.config/lazydocker"

# Symlink the lazydocker config from .dotfiles
ln -sf "$HOME/.dotfiles/lazydocker/config.yml" "$HOME/.config/lazydocker/config.yml"
