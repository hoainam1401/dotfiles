#!/usr/bin/env sh
set -eu

REPO_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
BACKUP_DIR="$HOME/.dotfiles-backup/$(date +%Y%m%d-%H%M%S)"

link_file() {
  source_path=$1
  target_path=$2
  target_dir=$(dirname "$target_path")
  mkdir -p "$target_dir"

  if [ -e "$target_path" ] || [ -L "$target_path" ]; then
    if [ "$(readlink "$target_path" 2>/dev/null || true)" = "$source_path" ]; then
      printf 'Already linked: %s\n' "$target_path"
      return
    fi
    mkdir -p "$BACKUP_DIR"
    backup_name=$(printf '%s' "$target_path" | sed "s|^$HOME/||; s|/|__|g")
    mv "$target_path" "$BACKUP_DIR/$backup_name"
    printf 'Backed up: %s\n' "$target_path"
  fi

  ln -s "$source_path" "$target_path"
  printf 'Linked: %s -> %s\n' "$target_path" "$source_path"
}

link_file "$REPO_DIR/.zshrc" "$HOME/.zshrc"
link_file "$REPO_DIR/.zprofile" "$HOME/.zprofile"
link_file "$REPO_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$REPO_DIR/starship/catppuccin_mocha.toml" "$HOME/.config/starship.toml"

case "$(uname -s)" in
  Darwin) cava_config="$REPO_DIR/cava/config.macos" ;;
  *) cava_config="$REPO_DIR/cava/config" ;;
esac
link_file "$cava_config" "$HOME/.config/cava/config"

mkdir -p "$HOME/.config/cava"
link_file "$REPO_DIR/cava/shaders" "$HOME/.config/cava/shaders"

printf '\nCore terminal configuration installed. Restart Zsh or run: exec zsh\n'
if [ -d "$BACKUP_DIR" ]; then
  printf 'Previous files were saved in: %s\n' "$BACKUP_DIR"
fi
