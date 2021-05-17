#!/bin/sh
if test "$(which code-insiders)"; then
	if [ "$(uname -s)" = "Darwin" ]; then
		VSCODE_HOME="$HOME/Library/Application Support/Code"
	else
		VSCODE_HOME="$HOME/.config/Code"
	fi

	ln -sf "$DOTFILES/vscode/settings.json" "$VSCODE_HOME/User/settings.json"
	ln -sf "$DOTFILES/vscode/keybindings.json" "$VSCODE_HOME/User/keybindings.json"
	ln -sf "$DOTFILES/vscode/snippets" "$VSCODE_HOME/User/snippets"

	# from `code --list-extensions`
	modules="
aaron-bond.better-comments
alefragnani.numbered-bookmarks
eamodio.gitlens
esbenp.prettier-vscode
shyykoserhiy.vscode-spotify
wesbos.theme-cobalt2
golang.go
"
	for module in $modules; do
		code-insiders --install-extension "$module" || true
	done
fi

