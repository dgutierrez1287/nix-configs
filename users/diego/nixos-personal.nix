{ pkgs, ... }:

{
	environment.pathsToLink = [ "share/zsh" ];

	users.groups.diego = {gid = 1000;};

	users.users.diego = {
		isNormalUser = true;
		home = "${ if pkgs.stdenvNoCC.isDarwin then "/Users" else "/home" }/diego";
		extraGroups = [ "docker" "wheel" "users" "diego" ];
		shell = pkgs.zsh;
		uid = 1000;
		hashedPassword = "$6$efQy3G5bf/41gLdj$dA487jXxdlS1e2Pm1VMO1tSew8MRAcAlwF6Hyiu7Nl1Plnuc02yAXpRZsarBLq2XDBhwnwQb.Caw/cUDiyFwx.";
		openssh.authorizedKeys.keys = [
			"ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC713cxzQqyO/CVxrcayVBhFoyIlZEFgwNbYQocSZeiv/6vXoPMqvkxOihMIPcvMgc6f4LPZI8zt8QoFh9VfWWaugbizHRWOk78FZHn4A6i86w70PsYXSGQ3a1w2a+A7SemhypUmBA/1L9nhkzOgFOr+JSHvMbvYYCy0YB3tNYdOPxz/k5wkmjQfCYeviBH/8RzqSASHZFs0jBXJJwQDIJkiIeSFLtjcyQG11Tc8IJycxooIZNeUr7z2QrkzWHrkl/ItirUzaGG224mRFkwbpxbcdDzdybNFJW1owt47NPnURMJRoHS4ckE59K6Pm4ivovCUTYYO+G8P78rDGhAH3k/ diego"
		];
	};

	nixpkgs.overlays = [
		(import ../../overlays/default.nix)
        (import ./conf/neovim/plugins/sources.nix)
	];
}
