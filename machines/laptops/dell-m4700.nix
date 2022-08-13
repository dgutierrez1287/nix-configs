{config, pkgs, ...}: {
  imports = [
    ./shared.nix
    ../dev-linux-shared.nix
    ../efi_common.nix
  ];

}
