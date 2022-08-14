{config, pkgs, ...}: {
  imports = [
    ./shared.nix
    ../dev-linux-shared.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "dell-linux-test";

  networking.interfaces.enp6s0.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

  networking.firewall.allowedTCPPorts = [
    22
  ];
}
