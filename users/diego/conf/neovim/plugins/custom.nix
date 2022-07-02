{pkgs}: 

let 
	buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in 
{
    "telescope-fzy-native-nvim" = buildVimPlugin {
		pname = "telescope-fzy-native-nvim";
		version = "master";
		src = pkgs.fetchFromGitHub {
          owner = "nvim-telescope";
    		repo = "telescope-fzy-native.nvim";
    		rev = "7b3d2528102f858036627a68821ccf5fc1d78ce4";
			sha256 = "e6QxjKSUIfhuoEBWRTzF/RlmVbqNsoDz86e9a3s8ZNU=";
		};
	};
}


