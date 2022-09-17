{config, pkgs, ...}: {
  imports = [
    ../../modules/duplicity.nix
  ];

  # global packages
  environment.systemPackages = with pkgs; [
    gnumake
	killall
	niv
    xdg-utils
    xdg-launch
    w3m
    unzip

    # home-manager
    home-manager

    # nix utils to get fetch settings for packages
	nix-prefetch-github
	nix-prefetch
	nix-prefetch-git
  ];

  networking.firewall.enable = false;
}
