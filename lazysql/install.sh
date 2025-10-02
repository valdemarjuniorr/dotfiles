#!/bin/bash

set -e

if [[ "$OSTYPE" == "darwin"* ]]; then
	# macOS
	if ! command -v brew >/dev/null 2>&1; then
		echo "Homebrew not found. Please install Homebrew first."
		exit 1
	fi
	brew install --quiet --cask lazysql >/dev/null 2>&1
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
	# Linux
	curl -sSL https://github.com/jorgerojas26/lazysql/releases/latest/download/lazysql_Linux_x86_64.tar.gz | tar xz -C /tmp >/dev/null 2>&1
	sudo mv /tmp/lazysql /usr/local/bin/lazysql >/dev/null 2>&1
	sudo chmod +x /usr/local/bin/lazysql >/dev/null 2>&1
else
	echo "Unsupported OS."
	exit 1
fi

echo "lazysql installation complete."
