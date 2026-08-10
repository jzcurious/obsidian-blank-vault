# Obsidian Vault Template

This repository is a Linux-only template for creating Obsidian vaults with shared themes, plugins, and CSS snippets.

The goal is to avoid installing the same Obsidian plugins and themes separately for every single vault.

## How it works

Obsidian normally stores vault-specific configuration inside:

```text
.obsidian/
```

This template keeps the following directories as symbolic links:

```text
.obsidian/plugins   -> ~/.local/share/obsidian-shared/plugins
.obsidian/themes    -> ~/.local/share/obsidian-shared/themes
.obsidian/snippets  -> ~/.local/share/obsidian-shared/snippets
```

The shared location follows the standard XDG convention:

```text
${XDG_DATA_HOME:-$HOME/.local/share}/obsidian-shared
```

This means that all vaults created from this template will share the same installed plugins, themes, and snippets, saving disk space and configuration time.

## Requirements

- Linux
- Bash
- Git
- Obsidian

## Usage

Since this is a template, you should create your own independent repository rather than cloning this one directly.

**Step 1: Create your new repository**
1. Click the green **Use this template** button at the top right of this repository's GitHub page.
2. Select **Create a new repository**.
3. Give your new repository a name (e.g., `my-project-vault`) and create it.

**Step 2: Clone and set up locally**
Clone *your newly created* repository to your local machine:

```bash
git clone <your-new-repository-url>
cd <your-repository-name>
```

**Step 3: Run the setup script**
Make the script executable and run it to configure the symlinks:

```bash
chmod +x setup.sh
./setup.sh
```

**Step 4: Open in Obsidian**
Finally, open the folder as a vault in Obsidian.

## What the setup script does

The script creates the shared Obsidian directories on your system if they do not already exist:

```text
~/.local/share/obsidian-shared/plugins
~/.local/share/obsidian-shared/themes
~/.local/share/obsidian-shared/snippets
```

Then it replaces the local vault directories (`.obsidian/plugins`, etc.) with symbolic links pointing to the shared directories.

## Installing plugins and themes

After running the setup script, you can install Obsidian plugins and themes normally through the Obsidian app.

They will be stored in the global shared directory and instantly become available to all your other vaults that use this same setup.

*Note: While the plugin files are shared, you may still need to go into Obsidian's settings to **enable** specific community plugins for each vault (this is stored in `community-plugins.json`).*

## Important Git notes

Do not commit the actual `plugins`, `themes`, or `snippets` directories into Git. They are machine-local shared resources.

This template already includes them in `.gitignore`:

```gitignore
.obsidian/plugins/
.obsidian/themes/
.obsidian/snippets/
```

The rest of the `.obsidian` configuration (like `app.json`, `appearance.json`, `community-plugins.json`) **should** be committed, as this allows you and your teammates to share the vault's general settings and the list of enabled plugins.

## Re-running setup

It is completely safe to run `./setup.sh` multiple times. Existing symlinks will be automatically detected and skipped.
