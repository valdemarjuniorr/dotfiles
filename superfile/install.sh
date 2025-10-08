#!/bin/bash

# Create a dotfile installation for linux and macOS
set -e
if command -v spf &>/dev/null; then
	echo "superfile is already installed."
else
	echo "Installing superfile..."
	bash -c "$(curl -sLo- https://superfile.dev/install.sh)"
fi

# Detect OS
OS="$(uname)"

if [[ "$OS" == "Linux" ]]; then
	ln -sf $(pwd)/config.toml ~/.config/superfile/config.toml
elif [[ "$OS" == "Darwin" ]]; then
	ln -sf $(pwd)/config.toml ~/Library/Application Support/superfile/config.toml
else
	echo "Unsupported OS: $OS"
	exit 1
fi
