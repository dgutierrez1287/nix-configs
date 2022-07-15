{config, pkgs, ...}: {
  imports = [
    ./shared.nix
  ];

  # networking
  networking.computerName = "Diego's MacBook Pro";
}
