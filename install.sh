#!/bin/bash

set -e

DOTFILES_DIR=~/dotfiles
BACKUP_DIR=~/.dotfiles_backup_$(date +%s)

echo "📦 Backing up any existing dotfiles to $BACKUP_DIR"
mkdir -p "$BACKUP_DIR"

link() {
  src="$DOTFILES_DIR/$1"
  dest="$HOME/$2"  # Always expands to absolute path

  # Ensure parent directory exists
  mkdir -p "$(dirname "$dest")"

  if [ -e "$dest" ] || [ -L "$dest" ]; then
    echo "🔁 Backing up $dest"
    mv "$dest" "$BACKUP_DIR/"
  fi

  echo "🔗 Linking $src → $dest"
  ln -s "$src" "$dest"
}

# Home-level dotfiles
link ".zshrc" ".zshrc"
link ".xinitrc" ".xinitrc"
link ".vimrc" ".vimrc"
link ".tmux.conf" ".tmux.conf"
link ".myclirc" ".myclirc"

# Neovim config
link ".config/nvim" ".config/nvim"
link ".config/vifm" ".config/vifm"
link ".config/picom" ".config/picom"

# Suckless builds (st, dwm, dmenu, etc.)
link ".local/src/st" ".local/src/st"
link ".local/src/dwm" ".local/src/dwm"
link ".local/src/dmenu" ".local/src/dmenu"

echo "✅ Dotfiles setup complete!"

#how to use this in new machine?
#git clone git@github.com:yourusername/dotfiles_1.git ~/dotfiles 
# (this repo if you are readin in github)
#cd ~/dotfiles
#chmod +x install.sh
#./install.sh
