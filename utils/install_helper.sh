#!/bin/bash

# Function to check if a package is installed (for pacman packages)
is_installed_pacman() {
    pacman -Qi "$1" &> /dev/null
}

# Function to check if a package is installed (for AUR packages)
is_installed_aur() {
    paru -Q "$1" &> /dev/null
}

# Function to install packages with pacman
install_pacman_packages() {
    local packages=("$@")
    for pkg in "${packages[@]}"; do
        if ! is_installed_pacman "$pkg"; then
            echo "Installing $pkg with pacman..."
            sudo pacman -S --noconfirm "$pkg"
        else
            echo "$pkg is already installed."
        fi
    done
}

# Function to install packages with paru (AUR)
install_aur_packages() {
    local packages=("$@")
    for pkg in "${packages[@]}"; do
        if ! is_installed_aur "$pkg"; then
            echo "Installing $pkg from AUR..."
            paru -S --noconfirm "$pkg"
        else
            echo "$pkg is already installed."
        fi
    done
}

# Main execution: separate arguments for pacman and AUR
pacman_packages=()
aur_packages=()

# Separate pacman and AUR packages from the input arguments
for arg in "$@"; do
    if [[ "$arg" == aur:* ]]; then
        # If the package starts with "aur:", treat it as an AUR package
        aur_packages+=("${arg#aur:}")
    else
        pacman_packages+=("$arg")
    fi
done

# Install pacman packages
if [ ${#pacman_packages[@]} -gt 0 ]; then
    install_pacman_packages "${pacman_packages[@]}"
fi

# Install AUR packages
if [ ${#aur_packages[@]} -gt 0 ]; then
    install_aur_packages "${aur_packages[@]}"
fi
