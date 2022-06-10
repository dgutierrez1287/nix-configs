# Get the path to this Makefile and directory
MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

FLAKENAME ?= ""
NIXUSER ?= "diego"

list-vars:
	@echo "Repo Dir Path: ${MAKEFILE_DIR}"
	@echo "Flake name: ${FLAKENAME}"
	@echo "nix user: ${NIXUSER}"

prep-new:
	sudo rm -rf /nix-configs && \
	sudo mkdir -p  /nix-configs/hardware && \
	sudo cp /etc/nixos/hardware-configuration.nix /nix-configs/hardware/hardware-configuration.nix

copy-nix:
	sudo rsync -av \
		--exclude='vendor/' \
		--exclude='.git/' \
		--exclude='.git-crypt/'\
		--exclude='packer/' \
		--exclude='scripts/' \
		--exclude='shells/' \
		--exclude='hardware/' \
		--exclude='local-vm.sh' \
		--exclude='vmconfig.json.example' \
		--exclude='Makefile' \
		--exclude='.gitignore'\
		. /nix-configs/		

switch: copy-nix
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild switch --flake "/nix-configs#${FLAKENAME}"

test:
	copy-nix
	sudo NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM=1 nixos-rebuild test --flake "/nix-configs#$(FLAKENAME)"
