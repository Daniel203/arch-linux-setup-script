#!/bin/bash

logind_file="/etc/systemd/logind.conf"

# Check if the line already exists, and add it if not
if ! grep -q "^HandlePowerKey=suspend" "$logind_file"; then
    # Append the line at the end of the file
    echo "HandlePowerKey=suspend" | sudo tee -a "$logind_file" > /dev/null
    echo "Added 'HandlePowerKey=suspend' to $logind_file"

    # Reload the systemd daemon to apply changes
    sudo systemctl daemon-reload
else
    echo "'HandlePowerKey=suspend' is already present in $logind_file"
fi
