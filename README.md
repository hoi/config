# Shell Configuration

Portable shell configuration that works across both bash and zsh environments.

## Features

- **Git-aware prompt**: Shows current branch and dirty state
- **Smart aliases**: Common shortcuts for git, navigation, and tmux
- **Cross-shell compatible**: Works with both bash and zsh

## Quick Setup

Add this single line to your `~/.bashrc` or `~/.zshrc`:

```bash
source ~/config/init.sh
```

That's it! All features will be automatically loaded.

## What's Included

### Prompt Features
- Color-coded git status (green = clean, red = uncommitted changes)
- Shows current branch name
- Fast and lightweight

### Key Aliases
- `ll` - detailed file listing
- `c <name>` - cd to ~/workspace/<name>
- `mkd <dir>` - create directory and cd into it
- Git: `g`, `gco`, `gpo`, `gcom`, `gpom`, `gst`, `glg`
- Git functions: `rbm`, `clb`, `gpc`, `gsc`
- Tmux: `tls`, `t <session>`
- `extract <file>` - extract any archive type

### Files
- `init.sh` - Main entry point (source this!)
- `.alias` - All shell aliases and functions
- `prompt.sh` - Git-aware prompt configuration

## Customization

Edit these files to customize:
- `.alias` - Add your own aliases/functions
- `prompt.sh` - Change prompt colors and format

## Branch Support

All git functions automatically detect whether your repo uses `main` or `master` as the default branch.
