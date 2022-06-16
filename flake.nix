{
	description = "NixOS systems by Diego Gutierrez";

	inputs = {

		# url for nixpkgs 
		nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
		nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		
		# url for home manager package
		home-manager = {
			url = "github:nix-community/home-manager/release-21.11";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		# url for neovim nightly overlay
		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
	};

	outputs = {self, nixpkgs, home-manager, ...}@inputs: let
		mkDevVm = import ./lib/mkDevVm.nix;

		overlays = [
			inputs.neovim-nightly-overlay.overlay

			(final: prev: {
				# set go for the latest version
				go = inputs.nixpkgs-unstable.legacyPackages.${prev.system}.go_1_18;
			})
		];

	in {
		nixosConfigurations.vm-maindev = mkDevVm "vm-maindev" rec {
			inherit overlays nixpkgs home-manager;
			system = "x86_64-linux";
			user = "diego";
			guiType = "no-gui";
			machineType = "personal";
		};

		nixosConfigurations.vm-oddball = mkDevVm "vm-oddball" rec {
			inherit overlays nixpkgs home-manager;	
			system = "x86_64-linux";
			user = "diego-oddball";
			guiType = "no-gui";
			machineType = "work";
		};
	};
}
