#!/bin/bash

SERVICE_NAME="gsd-rfkill.service"
SERVICE_PATH="$HOME/.config/systemd/user/$SERVICE_NAME"

# Find the path to the gsd-rfkill binary
GSD_RFKILL_PATH=$(find /usr -name gsd-rfkill 2>/dev/null | head -n 1)

# Check if the binary was found
if [ -z "$GSD_RFKILL_PATH" ]; then
    echo "Error: Could not find gsd-rfkill."
    exit 1
fi

# If the service already exists, skip creation
if [ -f "$SERVICE_PATH" ]; then
    echo "Service already exists: $SERVICE_PATH"
    echo "Skipping creation. You can manage it with systemctl --user."
else
    echo "Creating service: $SERVICE_PATH"

    mkdir -p ~/.config/systemd/user

    cat > "$SERVICE_PATH" <<EOF
[Unit]
Description=Gnome RFKill support service
After=graphical.target

[Service]
BusName=org.gnome.SettingsDaemon.Rfkill
ExecStart=$GSD_RFKILL_PATH
Restart=on-failure
TimeoutStopSec=5
Type=dbus

[Install]
WantedBy=graphical-session.target
EOF

    systemctl --user daemon-reload
    systemctl --user start "$SERVICE_NAME"

    echo "Service $SERVICE_NAME created and started."
fi
