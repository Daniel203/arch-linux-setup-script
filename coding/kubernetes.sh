#!/bin/bash

# Install required packages
packages=(
    minikube
    kubectl
)

./utils/install_helper.sh "${packages[@]}"

# Add user to libvirt
sudo usermod -aG libvirt $(whoami)

# Set the kvm2 provider in minikube: 
minikube config set driver docker

# Start minikube 
# minikube start --driver=docker --container-runtime=containerd

