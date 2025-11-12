#!/bin/bash
# Modern shell prompt with git support
# Works with both bash and zsh

# Detect shell type
if [ -n "$ZSH_VERSION" ]; then
    SHELL_TYPE="zsh"
    # Enable prompt substitution for zsh
    setopt PROMPT_SUBST
else
    SHELL_TYPE="bash"
fi

# Color definitions (works for both bash and zsh)
if [ "$SHELL_TYPE" = "bash" ]; then
    # Bash colors (with \[ \] for proper line wrapping)
    COLOR_RESET='\[\033[0m\]'
    COLOR_USER='\[\033[0;36m\]'          # Cyan
    COLOR_AT='\[\033[0;92m\]'            # Bright green
    COLOR_HOST='\[\033[0;92m\]'          # Bright green
    COLOR_PATH='\[\033[1;33m\]'          # Bold yellow
    COLOR_GIT_CLEAN='\[\033[0;32m\]'     # Green
    COLOR_GIT_DIRTY='\[\033[0;91m\]'     # Bright red
else
    # Zsh colors (without \[ \])
    COLOR_RESET='%f'
    COLOR_USER='%F{cyan}'
    COLOR_AT='%F{green}'
    COLOR_HOST='%F{green}'
    COLOR_PATH='%F{yellow}'
    COLOR_GIT_CLEAN='%F{green}'
    COLOR_GIT_DIRTY='%F{red}'
fi

# Function to get git prompt info
git_prompt_color() {
    # Check if we're in a git repo
    git rev-parse --is-inside-work-tree &>/dev/null || return

    # Get current branch
    local branch=$(git symbolic-ref --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [ -z "$branch" ] && return

    # Check for uncommitted changes
    if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
        echo "${COLOR_GIT_DIRTY} (${branch})${COLOR_RESET}"
    else
        echo "${COLOR_GIT_CLEAN} (${branch})${COLOR_RESET}"
    fi
}

# Build the prompt
if [ "$SHELL_TYPE" = "bash" ]; then
    # Bash prompt: user@host:path (git-branch) $
    PS1="${COLOR_USER}\u${COLOR_AT}@${COLOR_HOST}\h${COLOR_RESET}:${COLOR_PATH}\w"
    PS1="${PS1}\$(git_prompt_color)${COLOR_RESET} \$ "
    export PS1
else
    # Zsh prompt: user@host:path (git-branch) $
    PROMPT="${COLOR_USER}%n${COLOR_AT}@${COLOR_HOST}%m${COLOR_RESET}:${COLOR_PATH}%~"
    PROMPT="${PROMPT}\$(git_prompt_color)${COLOR_RESET} \$ "
    export PROMPT
fi
