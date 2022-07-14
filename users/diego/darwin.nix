{ pkgs, ... }:

{
  environment.pathsToLink = [ "share/zsh" ];

  users.users.diego = {
    home = "/Users/diego";
    shell = pkgs.zsh;
  };

  nixpkgs.overlays = [
		(import ../../overlays/default.nix)
        (import ./conf/neovim/plugins/sources.nix)
	];
}
