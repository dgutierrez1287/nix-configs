{ config, pkgs, lib, ...}: 

let
	customPlugins = (import ../../sources/neovim-plugins.nix) { pkgs = pkgs; };
in
{
	# lua module files for custom configs
	home.file.".config/nvim/lua/dg/lsp.lua".source = ./conf/neovim/lua/dg/lsp.lua;
	home.file.".config/nvim/lua/dg/telescope.lua".source = ./conf/neovim/lua/dg/telescope.lua;

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
			(lib.strings.fileContents ./conf/neovim/commands.vim)
			(lib.strings.fileContents ./conf/neovim/float-term.vim)
			(lib.strings.fileContents ./conf/neovim/git.vim)
			(lib.strings.fileContents ./conf/neovim/lsp.vim)
            (lib.strings.fileContents ./conf/neovim/nvim-tree.vim)
            (lib.strings.fileContents ./conf/neovim/tree-sitter.vim)
            (lib.strings.fileContents ./conf/neovim/nvim-cmp.vim)
            (lib.strings.fileContents ./conf/neovim/glow.vim)
			(lib.strings.fileContents ./conf/neovim/snippets.vim)
			(lib.strings.fileContents ./conf/neovim/telescope.vim)
			(lib.strings.fileContents ./conf/neovim/tmux-nav.vim)
			(lib.strings.fileContents ./conf/neovim/undotree.vim)
			(lib.strings.fileContents ./conf/neovim/lualine.vim)
            (lib.strings.fileContents ./conf/neovim/colors.vim)
			(lib.strings.fileContents ./conf/neovim/comment-nvim.vim)
			(lib.strings.fileContents ./conf/neovim/vim-terraform.vim)
		];

		# extra packages neovim needs
		extraPackages = [
            # typescript
			pkgs.nodePackages.typescript
			pkgs.nodePackages.typescript-language-server

            # bash
			pkgs.nodePackages.bash-language-server

            #vim
      		pkgs.nodePackages.vim-language-server

            # lua
			pkgs.sumneko-lua-language-server			

            # golang
			pkgs.gopls

            # nixos
            pkgs.rnix-lsp

            # python
            pkgs.nodePackages.pyright

            # terraform
            pkgs.terraform-ls
		];
		plugins = with pkgs; [
			# lsp
			customVim.nvim-lspconfig
			customVim.nvim-cmp
		    customVim.lsp_signature-nvim

            # json
            customVim.nvim-jqx

            # tree-sitter 
            customVim.nvim-treesitter

            # Markdown
            customVim.glow-nvim

            # Editior stuff
            customVim.nvim-autopairs

			# snippets
			customVim.ultisnips
			customVim.telescope-ultisnips-nvim
			customVim.vim-snippets

			# terminal
		    customVim.vim-floaterm

			# file operations
            customVim.nvim-tree-lua
            customVim.nvim-web-devicons

			# look and feel
            customVim.zephyr-nvim
            customVim.material-nvim
            customVim.lualine-nvim

			# language stuff
			customVim.vim-terraform
            customVim.vim-nix

			# motion
			customVim.vim-tmux-navigator

			# undos
			customVim.undotree

			# git
			customVim.vim-fugitive
			customVim.vim-gitgutter
			customVim.git-worktree-nvim

			# comments
            customVim.comment-nvim

			# telescope and requirements
			customVim.popup-nvim
			customVim.plenary-nvim
			customVim.telescope-nvim
			customVim.telescope-fzf-native-nvim
		];
	};	
}
