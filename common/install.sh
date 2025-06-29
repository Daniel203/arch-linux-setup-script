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
    jq
    obsidian
    bitwarden

    telegram-desktop
    kitty
    mpv
    yt-dlp

    aur:vesktop-bin  # Discord alternative
    aur:spotify
    aur:zen-browser-bin
    aur:anki-bin
)

./utils/install_helper.sh "${packages[@]}"
