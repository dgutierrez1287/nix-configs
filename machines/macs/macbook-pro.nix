{config, pkgs, ...}: {
  imports = [
    ./shared.nix
  ];

  # networking
  networking.computerName = "Diego MacBook Pro";

  environment.systemPackages = with pkgs; [
  ];

  homebrew = {
    enable = true;

    casks = [
      "iterm2"
    ];
  };
}
