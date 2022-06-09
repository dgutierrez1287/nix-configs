#!/bin/bash

# Args
repo_dir=$1
flake_name=$2
user_name=$3

sudo rm -rf /nix-configs

ln -s /home/${user_name}/nix-configs /nix-configs

sudo cp /etc/nixos/hardware-configuration.nix /nix-configs/hardware/hardware-configuration.nix

