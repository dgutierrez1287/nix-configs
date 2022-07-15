{
	description = "NixOS systems by Diego Gutierrez";

	inputs = {

		# url for nixpkgs 
        #nixpkgs.url = "github:nixos/nixpkgs/release-21.11";
        nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
		
		# url for home manager package
		home-manager = {
            #url = "github:nix-community/home-manager/release-21.11";
            url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};

        darwin = {
            url = "github:lnl7/nix-darwin";
            inputs.nixpkgs.follows = "nixpkgs";
        };

		# url for neovim nightly overlay
		neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
	};

	outputs = {self, nixpkgs, home-manager, darwin, ...}@inputs: let
		mkDevVm = import ./lib/mkDevVm.nix; # Dev VM setup

        mkMac = import ./lib/mkMac.nix; # MacOS machine setup

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

        darwinConfigurations.mac-mini = mkMac "mac-mini" rec {
            inherit overlays nixpkgs home-manager darwin;
            system = "x86_64-darwin";
            user = "diego";
            guiType = "gui";
            machineType = "personal";
        };

        darwinConfigurations.macbook-pro = mkMac "macbook-pro" rec {
            inherit overlays nixpkgs home-manager darwin;
            system = "aarch64-darwin";
            user = "diego";
            guiType = "gui";
            machineType = "personal";
        };
	};
}
