!/bin/sh

# Install vim-plug for Vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Create Vim config directory and symlink configuration
mkdir -p ~/.vim
ln -sf "$DOTFILES/vim/init.lua" ~/.vim/vimrc

# Install and update plugins for Vim
vim +PlugInstall </dev/tty
vim +PlugUpdate </dev/tty

# If neovim is installed, set it up too
if which nvim >/dev/null 2>&1; then
    # Install vim-plug for Neovim
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    # Create Neovim config directory and symlink configuration
    mkdir -p ~/.config/nvim/
    ln -sf "$DOTFILES/vim/init.lua" ~/.config/nvim/init.lua

    # Install and update plugins for Neovim
    nvim +PlugInstall </dev/tty
    nvim +PlugUpdate </dev/tty
fi
