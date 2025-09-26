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
    btop
    wl-clipboard
    yq
    jq
    obsidian
    bitwarden
    telegram-desktop
    kitty
    mpv
    chromium
    proton-vpn-gtk-app
    thunderbird
    protonmail-bridge
    kdeconnect
    feh
    playerctl
    tailscale
    zathura
    zathura-pdf-mupdf
    virtualbox-host-modules-arch
    virtualbox
    virtualbox-guest-iso

    aur:vesktop-bin  # Discord alternative
    aur:spotify
    aur:zen-browser-bin
    aur:anki-bin
)

./utils/install_helper.sh "${packages[@]}"
