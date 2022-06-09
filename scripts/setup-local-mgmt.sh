#!/bin/bash

# Args
flake_name=$1
user_name=$2

sudo rm -rf /nix-configs

sudo ln -s /home/${user_name}/nix-configs /nix-configs

sudo cp /etc/nixos/hardware-configuration.nix /nix-configs/hardware/hardware-configuration.nix

