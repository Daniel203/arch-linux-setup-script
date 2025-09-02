#!/bin/bash

TARGET_DIR="$HOME/dotfiles"
REPO_URL="https://github.com/Daniel203/dotfiles.git"  
REPO_SSH_URL="git@github.com:Daniel203/dotfiles.git"  

to_stow=(
    ags
    kitty
    tmux
    xdg-desktop-portal
    zsh
    hypr
    nvim
    Wallpapers
    zathura
    rofi
)  


# If folder doesn't exist or is empty, then continue
if [[ ! -d "$TARGET_DIR" || -z "$(ls -A "$TARGET_DIR" 2>/dev/null)" ]]; then
    echo "Cloning dotfiles into $TARGET_DIR..."
    git clone "$REPO_URL" "$TARGET_DIR"
else
    echo "$TARGET_DIR already exists and is not empty — skipping clone."
fi

# # If possible, convert the clone to ssh
# if ssh -T git@github.com 2>&1 | grep -q "successfully authenticated"; then
#     echo "SSH is working. Converting remote to SSH..."
#     git -C "$REPO_DIR" remote set-url origin $REPO_SSH_URL
#     git -C "$REPO_DIR" remote -v
# else
#     echo "SSH key not working with GitHub. Keeping HTTPS remote."
# fi

# If stow is installed, stow the dotfiles
if pacman -Qi stow &>/dev/null; then
    echo "Running stow in $TARGET_DIR"
    (
	cd "$TARGET_DIR" || { echo "Could not cd into $TARGET_DIR"; exit 1; }

	for dir in "${to_stow[@]}"; do
	    echo "Stowing $dir..."
	    stow "$dir"
	done
    )
    echo "Finished applying all the configuration files"
fi

# Make zsh default shell
current_shell=$(basename "$SHELL")

if [ "$current_shell" != "zsh" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(command -v zsh)"
fi
