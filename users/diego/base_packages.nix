{lib, config, pkgs, os, ...}:

{
	nixpkgs.config.allowUnFree = true;

	# packages 
	home.packages = with pkgs; [
		fd
		ninja
		bat
		fzf
		jq
        #yq
		wget
		curl
		ripgrep
		iftop
		htop
		pstree
		nix-tree
		nix-update
        gnupg
      ] 
      ++(if os == "Linux"
      then [
        yq
      ]
      else[]);

}
