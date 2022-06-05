{pkgs}: 

let 
	buildVimPlugin = pkgs.vimUtils.buildVimPluginFrom2Nix;
in 
{
	"nvim-lspconfig" = buildVimPlugin {
		pname = "nvim-lspconfg";
		version = "v0.1.3";
		src = pkgs.fetchFromGitHub {
			owner = "neovim";
    		repo = "nvim-lspconfig";
    		rev = "99596a8cabb050c6eab2c049e9acde48f42aafa4";
    		sha256 = "qU9D2bGRS6gDIxY8pgjwTVEwDTa8GXHUUQkXk9pBK/U=";
		};
	};

	"nvim-cmp" = buildVimPlugin {
		pname = "nvim-cmp";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "hrsh7th";
    		repo = "nvim-cmp";
    		rev = "f81bfee10909e39c82ccd230f6f997438b16092e";
    		sha256 = "Fr5ZrcbDQU/fLcV3qvhud4UzaUBm56Jh+HgWEPzsDCw=";
		};
	};

	"lsp_signature-nvim" = buildVimPlugin {
		pname = "lsp_signature-nvim";
		version = "v0.1.1";
		src = pkgs.fetchFromGitHub {
			owner = "ray-x";
    		repo = "lsp_signature.nvim";
    		rev = "422006c33c0da8947772c3a1040fa6c93be418d8";
    		sha256 = "BCjx2F3zdL0/Kwf4vxC/xIVE/XdnWGp2lX4gpn5a6QA=";
		};
	};

	"ultisnips" = buildVimPlugin {
		pname = "ultisnips";
		version = "3.2";
		src = pkgs.fetchFromGitHub {
			owner = "SirVer";
    		repo = "ultisnips";
    		rev = "7dc30c55e5c41c98a8c7421bb01fec1d559256fd";
    		sha256 = "d7nUt7NbGTLflSer2nWsJf/ATbI0A90J3qL+OSEa35Y=";
		};
	};

	"telescope-ultisnips-nvim" = buildVimPlugin {
		pname = "telescope-ultisnips-nvim";
		version = "main";
		src = pkgs.fetchFromGitHub {
			owner = "fhill2";
    		repo = "telescope-ultisnips.nvim";
    		rev = "f48b6d4f53b31507d3fd514905c6940409e8ada8";
    		sha256 = "h2PfstopgjCMFYVOnzEX7gkkIHCamcJPJux5B+qYYww=";
		};
	};

	"vim-snippets" = buildVimPlugin {
		pname = "vim-snippets";
		version = "1.0.0";
		src = pkgs.fetchFromGitHub {
			owner = "honza";
    		repo = "vim-snippets";
    		rev = "4ed409154bcaa32fba6fd153cc0c915e44982872";
    		sha256 = "O+zK3d69mrAMh6Jeb+i+U2OrcKEUKwyixyLFBCVEKV0=";
		};
	};

	"vim-floaterm" = buildVimPlugin {
		pname = "vim-floaterm";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "voldikss";
    		repo = "vim-floaterm";
    		rev = "ab7876f86c05c1935eb23a193f4f276132902ac1";
    		sha256 = "kd6AiWS+1cR5gAgWoLGQS7Uvb4VM8m4gp2LFkPdUJoI=";
		};
	};

	"nerdtree" = buildVimPlugin {
		pname = "nerdtree";
		version = "6.10.16";
		src = pkgs.fetchFromGitHub {
			owner = "preservim";
    		repo = "nerdtree";
    		rev = "9310f91476a94ee9c2f3a587171893743a343e26";
    		sha256 = "lzF6BpoT4KgXgTc4wL0IaUSg9Uszu7qcY+hZgxTFKOo=";
		};
	};

	"nerdtree-git" = buildVimPlugin {
		pname = "nerdtree-git";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "Xuyuanp";
    		repo = "nerdtree-git-plugin";
    		rev = "e1fe727127a813095854a5b063c15e955a77eafb";
    		sha256 = "H3IxxQwz3Q1nO7oSDKCtoGCsoPDWO3jRjqtwp3Kp/TQ=";
		};
	};

	"vim-devicons" = buildVimPlugin {
		pname = "vim-devicons";
		version = "v0.11.0";
		src = pkgs.fetchFromGitHub {
			owner = "ryanoasis";
    		repo = "vim-devicons";
    		rev = "4db2a6ddaf66afa16105b7d2a13f81a9bb5ff9fc";
    		sha256 = "DxH6bqbT00yzhyboIh+J/2LxuEK0YO7ufGl4fjQKyAI=";
		};
	};

	"nerdtree-syntax-highlight" = buildVimPlugin {
		pname = "nerdtree-syntax-highlight";
		version = "v0.1.5";
		src = pkgs.fetchFromGitHub {
			owner = "tiagofumo";
    		repo = "vim-nerdtree-syntax-highlight";
    		rev = "6225131f1fab7782a05b8cf3fc3d6483f84638b5";
    		sha256 = "NsE5pmOt1h0ruU73VNY4W//6P5Uj3fQCqL87xO44pUM=";
		};
	};

	"vim-colorschemes" = buildVimPlugin {
		pname = "vim-colorschemes";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "flazz";
    		repo = "vim-colorschemes";
    		rev = "fd8f122cef604330c96a6a6e434682dbdfb878c9";
    		sha256 = "JhBnyvuKqP0ddKTUi+oVrfBd4Af/pxW4Goe+DfjB6LE=";
		};
	};

	"vim-airline" = buildVimPlugin {
		pname = "vim-airline";
		version = "v0.11";
		src = pkgs.fetchFromGitHub {
			owner = "vim-airline";
    		repo = "vim-airline";
    		rev = "ad716f1df4f89589c0b13b9a39e68a10adba5e13";
    		sha256 = "8zSK98AHfXo247Efm0XxkzQxkfjN3XKY3xcRM06ueqo=";
		};
	};

	"vim-airline-themes" = buildVimPlugin {
		pname = "vim-airline-themes";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "vim-airline";
    		repo = "vim-airline-themes";
    		rev = "97cf3e6e638f936187d5f6e9b5eb1bdf0a4df256";
    		sha256 = "kQs2pEGCV3d1agced5LTHpnj7bBkKYL/9J32g8OSfTE=";
		};
	};

	"vim-terraform" = buildVimPlugin {
		pname = "vim-terraform";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "hashivim";
    		repo = "vim-terraform";
    		rev = "f0b17ac9f1bbdf3a29dba8b17ab429b1eed5d443";
    		sha256 = "atyMKr5WChLBRDyO1KznH2LQzv5P+K+RQpQ71aeJB0k=";
		};
	};

	"vim-tmux-navigator" = buildVimPlugin {
		pname = "vim-tmux-navigator";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "christoomey";
    		repo = "vim-tmux-navigator";
    		rev = "9ca5bfe5bd274051b5dd796cc150348afc993b80";
    		sha256 = "Zz0gmp/32h/KF3qygUPy2d8/jfqJJXHogPw4zvEiG4c=";
		};
	};

	"undotree" = buildVimPlugin {
		pname = "undotree";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "mbbill";
    		repo = "undotree";
    		rev = "08e259be24d4476c1ee745dc735eefd44f90efdc";
    		sha256 = "vsbJxVIAxwPssVC3wGNQmoUw8XNw4itkQx1SoDMvk5Q=";
		};
	};

	"vim-fugitive" = buildVimPlugin {
		pname = "vim-fugitive";
		version = "master"; 
		src = pkgs.fetchFromGitHub {
			owner = "tpope";
    		repo = "vim-fugitive";
    		rev = "b7287bd5421da62986d9abf9131509b2c9f918e4";
    		sha256 = "t7IFrcAqE/H8W6MIjthOfs3Ot/GWfWHKD1mu96HUE0A=";
		};
	};

	"vim-gitgutter" = buildVimPlugin {
		pname = "vim-gitgutter";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "airblade";
    		repo = "vim-gitgutter";
    		rev = "719d4ec06a0fb0aa9f1dfaebcf4f9691e8dc3f73";
    		sha256 = "V8ZKnZ+gd7QNdNO2kdk9tWvJOyyGp2yqdpzJ24lut9U=";
		};
	};

	"git-worktree-nvim" = buildVimPlugin {
		pname = "git-worktree-nvim";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "ThePrimeagen";
    		repo = "git-worktree.nvim";
    		rev = "d7f4e2584e81670154f07ca9fa5dd791d9c1b458";
    		sha256 = "pkJkdt2XC1w0s1VpnxJFnoYiEgD01MZ7a5i2AlU1hMw=";
		};
	};

	"vim-commentary" = buildVimPlugin {
		pname = "vim-commentary";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "tpope";
    		repo = "vim-commentary";
    		rev = "3654775824337f466109f00eaf6759760f65be34";
    		sha256 = "NxrkDM25pQ63ZRbA0l5AHxaWBSn4o2eaK7uNDzIqOyY=";
		};
	};

	"popup-nvim" = buildVimPlugin {
		pname = "popup-nvim";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "nvim-lua";
    		repo = "popup.nvim";
    		rev = "b7404d35d5d3548a82149238289fa71f7f6de4ac";
    		sha256 = "dNWz/xovUg55fDZUpVs/2kLphk3lqQyvPtc9ATwbeSQ=";
		};
	};

	"plenary-nvim" = buildVimPlugin {
		pname = "plenary-nvim";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "nvim-lua";
    		repo = "plenary.nvim";
    		rev = "9069d14a120cadb4f6825f76821533f2babcab92";
    		sha256 = "QKVFz95XaJrwkFaWqUHBirMFagellRn2YpNYnBeI/10=";
		};
	};

	"telescope-nvim" = buildVimPlugin {
		pname = "telescope-nvim";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "nvim-telescope";
    		repo = "telescope.nvim";
    		rev = "4681dcdffe20e1f23b6b9ccf28836537ed166c47";
    		sha256 = "8wk7Yz7oNkgTwYEQmqa3S9waIPhFGJLWjS8zVIK2QtE=";	
		};
	};

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

	"nvim-web-devicons" = buildVimPlugin {
		pname = "nvim-web-devicons";
		version = "master";
		src = pkgs.fetchFromGitHub {
			owner = "kyazdani42";
    		repo = "nvim-web-devicons";
    		rev = "bdd43421437f2ef037e0dafeaaaa62b31d35ef2f";
    		sha256 = "hYFDefTMcdtoQLhwUaamyGuid69kUo+95P1wjoS2dmo=";
		};
	};
}