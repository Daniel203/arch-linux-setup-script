#!/bin/bash

packages=(
    docker
    minikube
    kubectl

    # Non so se servono tutti
    # libvirt 
    # qemu-desktop 
    # dnsmasq 
    # iptables-nft
)

./utils/install_helper.sh "${packages[@]}"

