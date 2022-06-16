{config, pkgs, ...}: {

  boot.kernelPackages = pkgs.linuxPackages_5_15;

  # use unstable nix so we can access flakes
  nix = {
    package = pkgs.nixUnstable;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

 	boot.loader.systemd-boot.enable = true;
  	boot.loader.efi.canTouchEfiVariables = true;

	time.timeZone = "America/New_York";

	# this will be deprecated in the future per interface
	# setting will be required
	networking.useDHCP = false;

	# no password for sudo
	security.sudo.wheelNeedsPassword =false;

	# enable docker
	virtualisation.docker.enable = true;

	# default locale
	i18n.defaultLocale = "en_US.UTF-8";

	# global packages
	environment.systemPackages = with pkgs; [
		gnumake
		killall
		niv
        xdg-utils
        xdg-launch
        w3m

		# nix utils to get fetch settings for packages
		nix-prefetch-github
		nix-prefetch
		nix-prefetch-git
	];

	# ssh settings
	services.openssh.enable = true;
	services.openssh.passwordAuthentication = true;
	services.openssh.permitRootLogin = "yes";

	# disable the firewall
	networking.firewall.enable = false;

	# This value determines the NixOS release from which the default
  	# settings for stateful data, like file locations and database versions
  	# on your system were taken. It‘s perfectly fine and recommended to leave
  	# this value at the release version of the first install of this system.
  	# Before changing this value read the documentation for this option
  	# (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
	system.stateVersion = "21.11";
}
