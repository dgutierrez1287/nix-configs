{config, pkgs, ...}: {
  imports = [
    ./shared.nix
    ../dev-linux-shared.nix
    ../efi_common.nix
  ];

  networking.hostName = "diego-lix-wkst";

  networking.firewall.allowTCPPorts = [
    22
  ];

}
