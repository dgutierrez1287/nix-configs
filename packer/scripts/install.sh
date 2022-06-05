#!/bin/sh -e

packer_http=$(cat .packer_http)

# create partition
cat <<FDISK | fdisk /dev/sda
n




a
w

FDISK

# create filesystem
mkfs.ext4 -j -L nixos /dev/sda1

# mount filesystem
mount LABEL=nixos /mnt

# Generate config
nixos-generate=config --root /mnt

# copy vagrant specific nix configs
curl -sf "${packer_http}/vagrant_nix_base/network.nix" > /mnt/etc/nixos/vagrant_base/network.nix
curl -sf "${packer_http}/vagrant_nix_base/hostname.nix" > /mnt/etc/nixos/vagrant_base/hostname.nix
curl -sf "${packer_http}/vagrant_nix_base/${PACKER_BUILDER_TYPE}_base.nix" > /mnt/etc/nixos/vagrant_base/hypervisor-base.nix
curl -sf "${packer_http}/vagrant_nix_base/configuration.nix" > /mnt/etc/nixos/configuration.nix

# install
nixos-install

# cleanup 
for x in $(seq 0 2) ; do
  nix-env --delete-generations old
  nix-collect-garbage -d
done
