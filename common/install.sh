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
    # Latex in vim
    tree-sitter-cli
    texlive-binextra
    texlive-basic 
    texlive-latex
    texlive-langenglish
    texlive-latexextra
    texlive-science
    gvfs-dnssd # For dav support in nautilus
    nextcloud-client

    aur:vesktop-bin  # Discord alternative
    aur:spotify
    aur:zen-browser-bin
    aur:anki-bin
)

./utils/install_helper.sh "${packages[@]}"
