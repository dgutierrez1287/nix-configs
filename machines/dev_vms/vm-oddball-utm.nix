{config, pkgs, ... }: {
	imports = [
		./shared.nix
        ../dev-linux-shared.nix
        ../efi_common.nix
        ./oddball-shared.nix
	];

	networking.interfaces.enp0s6.useDHCP = true;
    networking.interfaces.enp0s9.useDHCP = true;

	networking.hostName = "oddball-dev-utm";
}
