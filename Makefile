# Get the path to this Makefile and directory
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

FLAKENAME ?= ""

prep-new:
	sudo cp /etc/nixos/hardware-configuration.nix ./hardware/hardware-configuration.nix && \
	sudo git config --global --add safe.directory /home/diego/nix-configs

switch:
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake ".#${FLAKENAME}"

test:
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild test --flake ".#$(FLAKENAME)"
