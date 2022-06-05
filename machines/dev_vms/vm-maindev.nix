{config, pkgs, ... }: {
	imports = [
		./shared.nix
	];

	networking.interfaces.ens33.useDHCP = true;
    networking.interfaces.ens34.useDHCP = true;

	networking.hostName = "main-dev";
}
