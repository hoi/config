# Shell Configuration

Portable shell configuration that works across both bash and zsh environments.

## Features

- **Git-aware prompt**: Shows current branch, dirty state, and upstream status
- **Smart aliases**: Common shortcuts for git, navigation, and tmux
- **Git completion**: Tab completion for git commands and aliases (bash)
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
- Shows branch name
- Indicators for:
  - `*` - unstaged changes
  - `+` - staged changes
  - `%` - untracked files
  - `$` - stashed changes
  - `</>` - behind/ahead of upstream

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
- `git-prompt.sh` - Official git prompt functions
- `.git-completion.bash` - Git completion (bash only)
- `bash_completion` - Completion for git aliases
- `commit-template.txt` - Git commit message template

## Customization

Edit these files to customize:
- `.alias` - Add your own aliases/functions
- `prompt.sh` - Change prompt colors and format
- `commit-template.txt` - Modify git commit template

## Branch Support

All git functions automatically detect whether your repo uses `main` or `master` as the default branch.
