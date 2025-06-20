#!/bin/bash

packages=(
    git
    curl
    nvim
    paru
    stow
    zsh
    tmux
    fzf
    wget
    sed

    telegram-desktop
    kitty
)

aur_packages=(
    vesktop-bin  # Discord alternative
    spotify
    zen-browser-bin
)

# Install with pacman
for pkg in "${packages[@]}"; do
    if ! pacman -Qi "$pkg" &> /dev/null; then
	echo "Installing $pkg..."
	sudo pacman -S --noconfirm "$pkg"
    else
	echo "$pkg is already installed."
    fi
done

# Install with paru
for pkg in "${aur_packages[@]}"; do
    if ! pacman -Qi "$pkg" &> /dev/null; then
        echo "Installing $pkg from AUR..."
        paru -S --noconfirm "$pkg"
    else
        echo "$pkg is already installed."
    fi
done
