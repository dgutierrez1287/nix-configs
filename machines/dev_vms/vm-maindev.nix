{config, pkgs, ... }: {
	imports = [
		./shared.nix
        ../dev-linux-shared.nix
        ../efi_common.nix
	];

	networking.interfaces.enp0s6.useDHCP = true;

	networking.hostName = "main-dev";
}
