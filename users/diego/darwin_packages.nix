{lib, config, pkgs, ...}:

{
  nixpkgs.config.allowUnFree = true;

  home.packages = with pkgs; [
  ];
}
