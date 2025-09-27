#!/bin/bash

packages=(
    hyprland 
    hypridle
    hyprlock
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
    aur:dms-shell-git
    gammastep
    aur:matugen-bin

    # ags stuff
    typescript
	npm
	meson
	gjs
	gtk3
	gtk-layer-shell
	gnome-bluetooth-3.0
	upower
	networkmanager
	gobject-introspection
	libdbusmenu-gtk3
	libsoup3
    brightnessctl
    swww
    glib2
    glib2-devel
    ttf-ubuntu-mono-nerd
    nwg-look
    aur:sass 
    aur:bun-bin
    aur:matugen
)

./utils/install_helper.sh "${packages[@]}"

# Install AGS manually because there's no AUR package with v1 working
if ! command -v ags &> /dev/null; then
    (
        cd /tmp || { echo "Could not cd into /tmp"; exit 1; }

        # Clean any previous clone
        rm -rf ags
        git clone https://github.com/Aylur/ags.git || { echo "Failed to clone AGS repo"; exit 1; }

        cd ags || { echo "Could not cd into /tmp/ags"; exit 1; }
        git checkout v1

        # Step 2: Patch greetd.ts
        ts_file="src/service/greetd.ts"
        if [[ -f "$ts_file" ]]; then
            sed -i '105d' "$ts_file" # Delete the original line 105

            # Insert the replacement lines at line 105
            sed -i '105i\
                        const raw = data.get_data();\
                        if (!raw) throw new Error("Failed to read data");\
                        const length = new DataView(raw.buffer, raw.byteOffset, raw.byteLength).getUint32(0, true);' "$ts_file"

        else
            echo "Could not find $ts_file"
            exit 1
        fi

        # Step 3: Build and install
        echo "Installing dependencies and building AGS..."
        npm install || { echo "npm install failed"; exit 1; }
        npm audit fix || { echo "npm audit fix failed"; exit 1; }
        meson setup build || { echo "meson setup failed"; exit 1; }
        meson install -C build || { echo "meson install failed"; exit 1; }
    )

    echo "AGS built and installed successfully!"
else
    echo "AGS is already installed."
fi

