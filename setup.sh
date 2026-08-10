#!/usr/bin/env bash
set -e

VAULT_DIR="$(cd "$(dirname "$0")" && pwd)"
OBSIDIAN_DIR="$VAULT_DIR/.obsidian"
SHARED="${XDG_DATA_HOME:-$HOME/.local/share}/obsidian-shared"

mkdir -p "$SHARED/plugins" "$SHARED/themes" "$SHARED/snippets"

for DIR in plugins themes snippets; do
  TARGET="$OBSIDIAN_DIR/$DIR"
  if [ -L "$TARGET" ]; then
    echo "⏭️  $DIR: symlink already exists, skipping"
  elif [ -e "$TARGET" ]; then
    echo "🗑️  $DIR: removing existing directory"
    rm -rf "$TARGET"
    ln -s "$SHARED/$DIR" "$TARGET"
    echo "✅ $DIR: symlink created"
  else
    ln -s "$SHARED/$DIR" "$TARGET"
    echo "✅ $DIR: symlink created"
  fi
done

rm README.md LICENSE

echo "✅ Done. Open vault in Obsidian and install plugins/themes."
