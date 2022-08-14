{lib, config, pkgs, ...}:
{
  home.packages = with pkgs; [
    google-chrome
    firefox
    synergy
    remmina
    terminator
  ];
}
