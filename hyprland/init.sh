#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/install.sh"
"$SCRIPT_DIR/fix_suspend.sh"
"$SCRIPT_DIR/fix_bluetooth_gcs.sh"
