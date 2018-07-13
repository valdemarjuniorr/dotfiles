#!/bin/sh
if test "$(which code)"; then
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
alefragnani.numbered-bookmarks
esbenp.prettier-vscode
ms-vscode.Go
PeterJausovec.vscode-docker
shyykoserhiy.vscode-spotify
wesbos.theme-cobalt2
"
	for module in $modules; do
		code --install-extension "$module" || true
	done
fi
