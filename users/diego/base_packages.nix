{lib, config, pkgs, ...}:

{
	nixpkgs.config.allowUnFree = true;

	# packages 
	home.packages = with pkgs; [
		fd
		ninja
		bat
		fzf
		jq
		wget
		curl
		ripgrep
		iftop
		htop
		pstree
		nix-tree
		nix-update
	];

}