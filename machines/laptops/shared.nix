{config, pkgs, ...}: {
  
  # global packages
  environment.systemPackages = with pkgs; [
    gnumake
    killall
    niv
    xdg-utils
    xdg-launch
    w3m
    unzip

    home-manager

    nix-prefetch-github
    nix-prefetch
    nix-prefetch-git
  ];

  nixpkgs.config.allowUnfree = true;

  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver = {
    enable = true;
    layout = "us";
    xkbVariant = "";
  };

  services.printing.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # networking.wireless.enable = true;
  networking.networkmanager.enable = true;
  networking.firewall.enable = true;
}
