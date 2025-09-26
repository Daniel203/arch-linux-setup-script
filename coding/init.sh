#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/java.sh"
"$SCRIPT_DIR/docker.sh"
# "$SCRIPT_DIR/minikube.sh"
