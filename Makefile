# Get the path to this Makefile and directory
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

FLAKENAME ?= ""

list-vars:
	@echo "Repo Dir Path: ${MAKEFILE_DIR}"
	@echo "Flake name: ${FLAKENAME}"

prep-new:
	

switch:
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake "/nix-configs#${FLAKENAME}"

test:
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild test --flake "/nix-configs#$(FLAKENAME)"
