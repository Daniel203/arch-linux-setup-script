#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/install.sh"
"$SCRIPT_DIR/generate_ssh_key.sh"
"$SCRIPT_DIR/setup_dotfiles.sh"
