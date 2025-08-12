#!/bin/bash
# Lazygit installation and dotfiles symlink script for Linux and macOS (Darwin/iOS)
set -e
# Import bootstrap script for common functions and variables
source "$HOME/.dotfiles/scripts/bootstrap.sh"

# Detect OS
OS="$(uname -s)"

INSTALL_CMD="sudo install"
LAZYGIT_URL=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "\K.*?(?=")')

case "$OS" in
    Linux*)
        LAZYGIT_TAR="lazygit_${LAZYGIT_URL#v}_Linux_x86_64.tar.gz"
        ;;
    Darwin*)
        # macOS (also works on iOS with a terminal; requires brew)
        if command -v brew &> /dev/null; then
            brew install lazygit
            LAZYGIT_INSTALLED=true
        else
            LAZYGIT_TAR="lazygit_${LAZYGIT_URL#v}_Darwin_x86_64.tar.gz"
        fi
        ;;
    *)
       fail  "Unsupported OS: $OS"
        exit 1
        ;;
esac

# If not installed via package manager, download binary
if [ -z "${LAZYGIT_INSTALLED}" ]; then
    success "Downloading lazygit binary..."
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/${LAZYGIT_URL}/${LAZYGIT_TAR}"
    tar -xzf lazygit.tar.gz lazygit
    $INSTALL_CMD lazygit /usr/local/bin/lazygit
    rm lazygit lazygit.tar.gz
fi

# Config directory
CONFIG_DIR="${HOME}/.config/lazygit"
DOTFILES_CONFIG="${HOME}/.dotfiles/lazygit/config.yml"

mkdir -p "$CONFIG_DIR"

# Symlink the lazygit config from dotfiles
ln -sf "$DOTFILES_CONFIG" "$CONFIG_DIR/config.yml"
success "Symlinked dotfiles config to $CONFIG_DIR/config.yml"

