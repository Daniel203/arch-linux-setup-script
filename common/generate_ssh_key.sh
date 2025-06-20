#!/bin/bash

KEY_FILE="$HOME/.ssh/id_ed25519"

# Ensure the .ssh directory exists
mkdir -p ~/.ssh
chmod 700 ~/.ssh

# Check if key already exists
if [[ -f "$KEY_FILE" ]]; then
    echo "SSH key already exists at $KEY_FILE"
else
    echo "Generating a new SSH key..."
    ssh-keygen -t ed25519 -C "$USER@$(hostname)" -f "$KEY_FILE" -N ""
    echo "SSH key generated."
fi

# Trust github by default
ssh-keyscan github.com >> ~/.ssh/known_hosts
