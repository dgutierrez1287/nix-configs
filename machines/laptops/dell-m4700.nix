{config, pkgs, ...}: {
  imports = [
    ./shared.nix
    ../dev-linux-shared.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sdb";
  boot.loader.grub.useOSProber = true;

  networking.interfaces.eno1.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;

services.xserver.displayManager.gdm.wayland = false;

  networking.hostName = "diego-lix-wkst";

  networking.firewall.allowedTCPPorts = [
    22
  ];

}
