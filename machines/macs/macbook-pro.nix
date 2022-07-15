{config, pkgs, ...}: {
  imports = [
    ./shared.nix
  ];

  # networking
  networking.computerName = "Diego MacBook Pro";

}
