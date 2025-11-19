#!/bin/bash

# Bootstrap script to symlink dotfiles to home directory

DOTFILES="$HOME/dotfiles"

# Create symlink, backing up existing file if present
link_file() {
    local src="$1"
    local dest="$2"

    if [[ -e "$dest" && ! -L "$dest" ]]; then
        echo "Backing up $dest to $dest.bak"
        mv "$dest" "$dest.bak"
    elif [[ -L "$dest" ]]; then
        rm "$dest"
    fi

    echo "Linking $src -> $dest"
    ln -s "$src" "$dest"
}

# Shell config
link_file "$DOTFILES/zshrc" "$HOME/.zshrc"

# Editor configs
link_file "$DOTFILES/joerc" "$HOME/.joerc"

# Screen
link_file "$DOTFILES/screenrc" "$HOME/.screenrc"

# VS Code
#mkdir -p "$HOME/.config/Code/User"
#link_file "$DOTFILES/Code/User/settings.json" "$HOME/.config/Code/User/settings.json"

echo "Done!"
