#!/usr/bin/env bash
set -e

VAULT_DIR="$(cd "$(dirname "$0")" && pwd)"
OBSIDIAN_DIR="$VAULT_DIR/.obsidian"
SHARED="${XDG_DATA_HOME:-$HOME/.local/share}/obsidian-shared"

mkdir -p "$SHARED/plugins" "$SHARED/themes" "$SHARED/snippets"

rm -rf "$OBSIDIAN_DIR/plugins" "$OBSIDIAN_DIR/themes" "$OBSIDIAN_DIR/snippets"

ln -s "$SHARED/plugins"  "$OBSIDIAN_DIR/plugins"
ln -s "$SHARED/themes"   "$OBSIDIAN_DIR/themes"
ln -s "$SHARED/snippets" "$OBSIDIAN_DIR/snippets"

echo "✅ Done. Open vault in Obsidian and install plugins/themes."
