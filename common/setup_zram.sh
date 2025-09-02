#!/bin/bash

# Install required packages
packages=(
    zram-generator
)

./utils/install_helper.sh "${packages[@]}"


# Create configuration file
CONF_FILE="/etc/systemd/zram-generator.conf"

echo "Writing zram configuration to $CONF_FILE..."

# Overwrite the config file with new content
sudo tee "$CONF_FILE" > /dev/null <<EOF
[zram0]
zram-size = max(ram, 4096)
compression-algorithm = zstd
swap-priority = 100
EOF

echo "zram configuration file successfully written."

# Optimize swap 
OPTIMIZATION_FILE="/etc/sysctl.d/99-vm-zram-parameters.conf"

echo "Writing zram optimization to $OPTIMIZATION_FILE..."

# Overwrite the config file with new content
sudo tee "$OPTIMIZATION_FILE" > /dev/null <<EOF
vm.swappiness = 180
vm.watermark_boost_factor = 0
vm.watermark_scale_factor = 125
vm.page-cluster = 0
EOF

echo "zram optimization file successfully written."

# Enable the service
ZRAM_SWAP_UNIT="systemd-zram-setup@zram0.service"

# Check if the swap unit is active
if systemctl is-active --quiet "$ZRAM_SWAP_UNIT"; then
    echo "Restarting $ZRAM_SWAP_UNIT"
    sudo systemctl restart "$ZRAM_SWAP_UNIT"
else
    echo "Starting $ZRAM_SWAP_UNIT..."
    sudo systemctl enable "$ZRAM_SWAP_UNIT"
    sudo systemctl start "$ZRAM_SWAP_UNIT"
fi

