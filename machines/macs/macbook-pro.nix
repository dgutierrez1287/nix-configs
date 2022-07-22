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
      "google-chrome"
      "firefox"
      "docker"
      "postman" # docker desktop
      "visual-studio-code"
      "mysqlworkbench"
      "pgadmin4"
      "slack"
      "microsoft-remote-desktop" #rdp
      "remarkable"
      "microsoft-edge"
      "dropbox"
      "handbrake"
      "gimp"
      "inkscape"
      "plex"
      "dash"
      "utm"
      "dbkoda"
      "nosql-workbench"


      ## Installed outside of nix ##
      # MS Office
      # Synergy
      # elgato
      # alfred
      # aldente
      # istat
      # barbee
      # messenger
    ];
  };
}
