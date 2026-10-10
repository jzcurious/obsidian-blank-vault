#!/usr/bin/env bash
set -e

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Initialize an Obsidian vault with shared plugins, themes and snippets.

Options:
  --vault  <path>   Path to the vault directory (default: current directory)
  --shared <path>   Path to the shared directory (default: \$XDG_DATA_HOME/obsidian-shared)
  --help            Show this help message

Examples:
  $(basename "$0")
  $(basename "$0") --vault ./my-vault
  $(basename "$0") --shared ~/my-shared
  $(basename "$0") --vault ./my-vault --shared ~/my-shared
EOF
  exit 0
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --vault)
      VAULT_ARG="$2"
      shift 2
      ;;
    --shared)
      SHARED_ARG="$2"
      shift 2
      ;;
    --help)
      usage
      ;;
    *)
      echo "❌ Unknown argument: $1"
      usage
      ;;
  esac
done

if [ -n "$VAULT_ARG" ]; then
  mkdir -p "$VAULT_ARG"
  VAULT_DIR="$(cd "$VAULT_ARG" && pwd)"
else
  VAULT_DIR="$(pwd)"
fi

if [ -n "$SHARED_ARG" ]; then
  mkdir -p "$SHARED_ARG"
  SHARED="$(cd "$SHARED_ARG" && pwd)"
else
  SHARED="${XDG_DATA_HOME:-$HOME/.local/share}/obsidian-shared"
fi

OBSIDIAN_DIR="$VAULT_DIR/.obsidian"

echo "📂 Vault:  $VAULT_DIR"
echo "📂 Shared: $SHARED"

mkdir -p "$SHARED/plugins" "$SHARED/themes" "$SHARED/snippets"
mkdir -p "$OBSIDIAN_DIR"

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

rm -f "$VAULT_DIR/README.md" "$VAULT_DIR/LICENSE"

echo "✅ Done. Open vault in Obsidian and install plugins/themes."
