#!/bin/bash

# Install required packages
packages=(
    jdk21-openjdk
    java-runtime-common
    gradle
)

./utils/install_helper.sh "${packages[@]}"


# On neovim use jdtls
