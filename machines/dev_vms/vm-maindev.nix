{config, pkgs, ... }: {
	imports = [
		./shared.nix
	];

	networking.interfaces.enp0s6.useDHCP = true;

	networking.hostName = "main-dev";
}
