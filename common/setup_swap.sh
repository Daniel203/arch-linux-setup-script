#!/bin/bash

# Configuration
SWAP_SUBVOL="/swap"
SWAP_FILE="$SWAP_SUBVOL/swapfile"
SWAP_SIZE="4G"
SWAP_PRIORITY=10

echo "Configuring Btrfs swap using the native Arch Linux method..."

# Create the subvolume if it doesn't exist
if [ ! -d "$SWAP_SUBVOL" ]; then
    echo "Creating subvolume $SWAP_SUBVOL..."
    sudo btrfs subvolume create "$SWAP_SUBVOL"
fi

# Use the Btrfs-native tool to create the swap file
# This automatically handles NOCOW (+C) and disables compression
echo "Creating $SWAP_SIZE swap file at $SWAP_FILE..."
sudo btrfs filesystem mkswapfile --size "$SWAP_SIZE" --uuid clear "$SWAP_FILE"

# Enable the swap file with priority
sudo swapon --priority "$SWAP_PRIORITY" "$SWAP_FILE"

# Update /etc/fstab for persistence
# Removes any existing swapfile entries first to prevent duplicates
sudo sed -i "\|^${SWAP_FILE} |d" /etc/fstab
echo "$SWAP_FILE none swap defaults,pri=$SWAP_PRIORITY 0 0" | sudo tee -a /etc/fstab
