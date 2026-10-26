#!/bin/bash

packages=(
    hyprland 
    hyprcursor
    hyprsunset
    hyprpicker
    hyprshot
    rofi 
    rofi-calc
    xdg-desktop-portal-hyprland
    polkit-gnome
    aur:bibata-cursor-theme-bin

    # dank material shell
    aur:dms-shell
    gammastep
    aur:matugen-bin
    cava 
    wl-clipboard 
    cliphist 
    brightnessctl
    aur:dgop
    aur:dsearch-bin

	gnome-bluetooth-3.0
	networkmanager
    brightnessctl
    ttf-ubuntu-mono-nerd
    ttf-iosevka
)

./utils/install_helper.sh "${packages[@]}"
