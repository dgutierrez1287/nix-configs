{config, pkgs, ...}: {
  # keyboard 
  system.keyboard.enableKeyMapping = true;
  system.keyboard.remapCapsLockToEscape = true;

  # finder changes
  system.defaults.finder.AppleShowAllExtensions = true;

  # nix-daemon
  services.nix-daemon.enable = true;

  # Fonts
  fonts.fontDir.enable = true;
  fonts.fonts = with pkgs; [
     recursive
     nerd-fonts
   ];

}
