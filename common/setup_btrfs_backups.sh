#!/bin/bash

packages=(
    grub-btrfs
    aur:timeshift-autosnap
)

./utils/install_helper.sh "${packages[@]}"

# Enable the service
sudo systemctl enable --now grub-btrfsd

# Configuration
service_file="/etc/systemd/system/grub-btrfsd.service"
new_execstart="ExecStart=/usr/bin/grub-btrfsd --syslog --timeshift-auto"

if [ -f "$service_file" ]; then
    # Check if the current ExecStart matches the desired one
    current_execstart=$(grep "^ExecStart=" "$service_file")

    if [ "$current_execstart" != "$new_execstart" ]; then
        sudo sed -i "s|^ExecStart=.*|$new_execstart|" "$service_file"
        sudo systemctl daemon-reload
        sudo systemctl restart grub-btrfsd
        echo "Service updated and restarted successfully."
    else
        echo "ExecStart is already correct. No change needed."
    fi
fi

