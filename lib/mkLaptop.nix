name: { nixpkgs, system, home-manager, user, overlays, guiType, machineType }:

nixpkgs.lib.nixosSystem rec {
    inherit system;

    modules = [
      
      # apply overlays
      { nixpkgs.overlays = overlays; }

      ../hardware/hardware-configuration.nix
      ../machines/laptops/${name}.nix
      ../users/${user}/nixos-${machineType}.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.users.${user} = {
          imports = [
            ../users/${user}/home-manager-${machineType}.nix
          ];
        };
        home-manager.extraSpecialArgs = {
          os = "Linux";
          username = user;
          currentSystem = system;
          machineType = machineType;
          machineUse = "dev";
          flakeName = name;
        };
      }
    ];

    extraArgs = {
      os = "Linux";
      username = user;
      guiType = guiType;
      machineType = machineType;
      currentSystem = system;
      machineUse = "dev";
      flakeName = name;
    };
}
