#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$HOME/.config/nvim"
DOTFILES_DIR="$HOME/.dotfiles/vim"
LAZYVIM_REPO="https://github.com/LazyVim/starter"

# Mason tools you want installed (matches mason registry names)
MASON_TOOLS=(
	pyright
	lua-language-server
	jdtls
	sonarlint-language-server
	checkstyle
	semgrep
	stylua
	google-java-format
	clang-format
	prettier
	shfmt
)

echo "🚀 LazyVim Installer"

# Clone LazyVim starter if missing
if [ ! -d "$CONFIG_DIR" ]; then
	echo "📥 LazyVim not found — installing..."
	git clone --depth 1 "$LAZYVIM_REPO" "$CONFIG_DIR"
	rm -rf "$CONFIG_DIR/.git"

	echo "🔗 Copying custom configuration..."
	cp -r "$DOTFILES_DIR"/* "$CONFIG_DIR"/
fi

echo "⚡ Bootstrapping plugins..."
nvim --headless "+Lazy! sync" +qa

echo "🛠 Installing Mason tools..."
if nvim --headless "+echo exists(':MasonToolsUpdate')" +qa | grep -q "2"; then
	# mason-tool-installer available
	nvim --headless "+MasonToolsUpdate" +qa
else
	echo "⚠️  mason-tool-installer not found — installing tools manually"
	for tool in "${MASON_TOOLS[@]}"; do
		echo "   ➜ Installing $tool..."
		nvim --headless -c "Lazy load mason.nvim" -c "MasonInstall $tool" -c "qa" || true
	done
fi

echo "✅ Setup complete!"
