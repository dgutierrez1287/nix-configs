{ config, pkgs, lib, ...}: 

let
	customPlugins = (import ../../sources/neovim-plugins.nix) { pkgs = pkgs; };
in
{
	# lua module files for custom configs
	home.file.".config/nvim/lua/dg/lsp.lua".source = ./conf/neovim/lua/dg/lsp.lua;
	home.file.".config/nvim/lua/dg/telescope.lua".source = ./conf/neovim/lua/dg/telescope.lua;
    home.file.".config/nvim/lua/dg/nvim-tree.lua".source = ./conf/neovim/lua/dg/nvim-tree.lua;

	programs.neovim = {
		enable = true;
		package = pkgs.neovim-nightly; # install the neovim nightly from the overlay
		
		# vi and vim aliases
		viAlias = true;
		vimAlias = true;
		vimdiffAlias = true;

		withNodeJs = true;
		withRuby = true;

		# python environments for neovim
		withPython3 = true;
		extraPython3Packages = (ps: with ps; [
			pynvim
			pip
			msgpack
			greenlet
		]);

		# configuration
		extraConfig = builtins.concatStringsSep "\n" [
			# vim configs
            (lib.strings.fileContents ./conf/neovim/general.vim)
			(lib.strings.fileContents ./conf/neovim/autopair.vim)
			(lib.strings.fileContents ./conf/neovim/colors.vim)
			(lib.strings.fileContents ./conf/neovim/commands.vim)
			(lib.strings.fileContents ./conf/neovim/float-term.vim)
			(lib.strings.fileContents ./conf/neovim/git.vim)
			(lib.strings.fileContents ./conf/neovim/lsp.vim)
            (lib.strings.fileContents ./conf/neovim/nvim-tree.vim)
            (lib.strings.fileContents ./conf/neovim/glow.vim)
			(lib.strings.fileContents ./conf/neovim/snippets.vim)
			(lib.strings.fileContents ./conf/neovim/telescope.vim)
			(lib.strings.fileContents ./conf/neovim/tmux-nav.vim)
			(lib.strings.fileContents ./conf/neovim/undotree.vim)
			(lib.strings.fileContents ./conf/neovim/vim-airline.vim)
			(lib.strings.fileContents ./conf/neovim/vim-commentary.vim)
			(lib.strings.fileContents ./conf/neovim/vim-terraform.vim)
		];

		# extra packages neovim needs
		extraPackages = [
			pkgs.nodePackages.typescript
			pkgs.nodePackages.typescript-language-server

			pkgs.nodePackages.bash-language-server
      		pkgs.nodePackages.vim-language-server

			pkgs.sumneko-lua-language-server			

			pkgs.gopls

			pkgs.tree-sitter
		];
		plugins = with pkgs; [
			# lsp
			customVim.nvim-lspconfig
			customVim.nvim-cmp
		    customVim.lsp_signature-nvim

            # Markdown
            customVim.glow-nvim

			# snippets
			customPlugins.ultisnips
			customPlugins.telescope-ultisnips-nvim
			customPlugins.vim-snippets

			# terminal
		    customPlugins.vim-floaterm

			# file operations
            customVim.nvim-tree-lua
            customVim.nvim-web-devicons

			# look and feel
			customPlugins.vim-colorschemes
			customPlugins.vim-airline
			customPlugins.vim-airline-themes

			# language stuff
			customPlugins.vim-terraform

			# motion
			customPlugins.vim-tmux-navigator

			# undos
			customPlugins.undotree

			# git
			customPlugins.vim-fugitive
			customPlugins.vim-gitgutter
			customPlugins.git-worktree-nvim

			# comments
			customPlugins.vim-commentary

			# telescope and requirements
			customPlugins.popup-nvim
			customPlugins.plenary-nvim
			customPlugins.telescope-nvim
			customPlugins.telescope-fzy-native-nvim
			#nvim-treesitter
		];
	};	
}
