#!/bin/bash
# Shell configuration entry point
# Source this from ~/.bashrc or ~/.zshrc:
#   source ~/config/init.sh

CONFIG_DIR="${HOME}/config"

# Source aliases (works for both bash and zsh)
if [ -f "${CONFIG_DIR}/.alias" ]; then
    source "${CONFIG_DIR}/.alias"
fi

# Source git prompt (works for both bash and zsh)
if [ -f "${CONFIG_DIR}/prompt.sh" ]; then
    source "${CONFIG_DIR}/prompt.sh"
fi
