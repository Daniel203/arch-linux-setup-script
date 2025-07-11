#!/bin/bash

DEFAULT_GIT_NAME="Daniel203"
DEFAULT_GIT_EMAIL="daniel.arduini@pm.me"

# --- Check and set Git User Name ---
GIT_NAME=$(git config --global user.name)
if [[ -z "$GIT_NAME" ]]; then
    echo "Git global user.name is not set."
    echo "Setting git global user.name to: \"$DEFAULT_GIT_NAME\""
    git config --global user.name "$DEFAULT_GIT_NAME"
fi

GIT_EMAIL=$(git config --global user.email)
if [[ -z "$GIT_EMAIL" ]]; then
    echo "Git global user.email is not set."
    echo "Setting git global user.email to: \"$DEFAULT_GIT_EMAIL\""
    git config --global user.email "$DEFAULT_GIT_EMAIL"
fi
