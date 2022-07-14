name: { nixpkgs, system, home-manager, darwin, user, overlays, guiType, machineType}:

darwin.lib.darwinSystem rec {
  inherit system;

  modules = [
    
    # apply overlays
    { nixpkgs.overlays = overlays; }

    # config imports
    ../machines/macs/${name}.nix
    ../users/${user}/darwin.nix

    # home-manager
    home-manager.darwinModules.home-manager {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.${user} = {
        imports = [
          ../users/${user}/home-manager-${machineType}.nix
        ];
      };

      home-manager.extraSpecialArgs = {
        username = user;
        guiType = guiType;
        currentSystem = system;
        machineType = machineType;
        machineUse = "dev";
        flakeName = name;
      };
    }
  ];

  #extraArgs = {
  #  username = user;
  #  guiType = guiType;
  #  machineType = machineType;
  #  currentSystem = system;
  # machineUse = "dev";
  #  flakeName = name;
  #};
}
