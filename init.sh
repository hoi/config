#!/bin/bash
# Shell configuration entry point
# Source this from ~/.bashrc or ~/.zshrc:
#   source ~/config/init.sh

CONFIG_DIR="${HOME}/config"

# Detect shell type
if [ -n "$ZSH_VERSION" ]; then
    SHELL_TYPE="zsh"
else
    SHELL_TYPE="bash"
fi

# Source aliases (works for both bash and zsh)
if [ -f "${CONFIG_DIR}/.alias" ]; then
    source "${CONFIG_DIR}/.alias"
fi

# Source git prompt (works for both bash and zsh)
if [ -f "${CONFIG_DIR}/prompt.sh" ]; then
    source "${CONFIG_DIR}/prompt.sh"
fi

# Git completion (bash only, zsh has built-in git completion)
if [ "$SHELL_TYPE" = "bash" ]; then
    # Source git completion
    if [ -f "${CONFIG_DIR}/.git-completion.bash" ]; then
        source "${CONFIG_DIR}/.git-completion.bash"
    fi

    # Enable completion for git aliases
    if [ -f "${CONFIG_DIR}/bash_completion" ]; then
        source "${CONFIG_DIR}/bash_completion"
    fi
fi

# Optional: Set git commit template if it exists
if [ -f "${CONFIG_DIR}/commit-template.txt" ]; then
    git config --global commit.template "${CONFIG_DIR}/commit-template.txt" 2>/dev/null
fi
