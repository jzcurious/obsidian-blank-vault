# obsidian-blank-vault

![Version](https://img.shields.io/badge/version-v1.0.0-blue)
![License](https://img.shields.io/github/license/jzcurious/obsidian-blank-vault)

A minimal [GitHub template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) for creating your own Obsidian vault repository with shared plugins, themes and snippets via symlinks.

## How it works

Instead of keeping plugins, themes and snippets inside each vault separately, this script creates symlinks from `.obsidian/` to a single shared directory. This way all your vaults share the same plugins and themes without duplication.

```
~/.local/share/obsidian-shared/
├── plugins/
├── themes/
└── snippets/

my-vault/
└── .obsidian/
    ├── plugins  -> ~/.local/share/obsidian-shared/plugins
    ├── themes   -> ~/.local/share/obsidian-shared/themes
    └── snippets -> ~/.local/share/obsidian-shared/snippets
```

## Getting started

### Option 1 — GitHub Template (recommended)

1. Click **[Use this template](https://github.com/jzcurious/obsidian-blank-vault/generate)** on GitHub
2. Create your own repository (e.g. `my-vault`)
3. Clone it and run setup:

```bash
git clone https://github.com/you/my-vault
cd my-vault
./setup.sh
```

### Option 2 — One-liner

```bash
bash <(curl -s https://raw.githubusercontent.com/jzcurious/obsidian-blank-vault/v1.0.0/setup.sh)
```

With options:

```bash
bash <(curl -s https://raw.githubusercontent.com/jzcurious/obsidian-blank-vault/v1.0.0/setup.sh) --vault ./my-vault --shared ~/my-shared
```

> ⚠️ Always review the script before running it. `bash <(curl ...)` lets you do that — unlike `curl | bash` which runs it blindly.

### Option 3 — Clone manually

```bash
git clone --branch v1.0.0 https://github.com/jzcurious/obsidian-blank-vault my-vault
cd my-vault
./setup.sh
```

## Usage

```bash
./setup.sh [OPTIONS]
```

### Options

| Option | Description | Default |
|---|---|---|
| `--vault <path>` | Path to the vault directory | Current directory |
| `--shared <path>` | Path to the shared directory | `$XDG_DATA_HOME/obsidian-shared` |
| `--help` | Show help message | |

### Examples

```bash
# current directory as vault
./setup.sh

# specify vault path
./setup.sh --vault ./my-vault

# specify shared directory
./setup.sh --shared ~/my-shared

# both options (order doesn't matter)
./setup.sh --vault ./my-vault --shared ~/my-shared
```

## Requirements

- `bash`
- `git`
- [Obsidian](https://obsidian.md/)

## Changelog

### [v1.0.0](https://github.com/jzcurious/obsidian-blank-vault/releases/tag/v1.0.0)
- Initial release
- Symlinks for plugins, themes and snippets
- `--vault` and `--shared` options
