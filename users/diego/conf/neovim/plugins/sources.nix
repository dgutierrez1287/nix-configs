self: super:

let sources = import ../../../../../nix/sources.nix; in rec {
  customVim = with self; {
    
    nvim-lspkind = vimUtils.buildVimPlugin {
      name = "nvim-lspkind";
      src = sources.lspkind-nvim;
    };

    nvim-tree-lua = vimUtils.buildVimPlugin {
      name = "nvim-tree-lua";
      src = sources.nvim-tree-lua;
    };

    nvim-web-devicons = vimUtils.buildVimPlugin {
      name = "nvim-web-devicons";
      src = sources.nvim-web-devicons;
    };

    nvim-cmp = vimUtils.buildVimPlugin {
      name = "nvim-cmp";
      src = sources.nvim-cmp;
      buildPhase = ":";
    };

    cmp-nvim-lsp = vimUtils.buildVimPlugin {
      name = "cmp-nvim-lsp";
      src = sources.cmp-nvim-lsp;
      buildPhase = ":";
    };

    cmp-buffer = vimUtils.buildVimPlugin {
      name = "cmp-buffer";
      src = sources.cmp-buffer;
      buildPhase = ":";
    };

    cmp-path = vimUtils.buildVimPlugin {
      name = "cmp-path";
      src = sources.cmp-path;
      buildPhase = ":";
    };

    cmp-cmdline = vimUtils.buildVimPlugin {
      name = "cmp-cmdline";
      src = sources.cmp-cmdline;
      buildphase = ":";
    };

    nvim-lspconfig = vimUtils.buildVimPlugin {
      name = "nvim-lspconfig";
      src = sources.nvim-lspconfig;
      buildPhase = ":";
    };

    lsp_signature-nvim = vimUtils.buildVimPlugin {
      name = "lsp_signature-nvim";
      src = sources.lsp_signature-nvim;
      buildPhase = ":";
    };

    glow-nvim = vimUtils.buildVimPlugin {
      name = "glow-nvim";
      src = sources.glow-nvim;
      buildPhase = ":";
    };

    nvim-autopairs = vimUtils.buildVimPlugin {
      name = "nvim-autopairs";
      src = sources.nvim-autopairs;
      buildPhase = ":";
    };

    vim-nix = vimUtils.buildVimPlugin {
      name = "vim-nix";
      src = sources.vim-nix;
      buildPhase = ":";
    };

    comment-nvim = vimUtils.buildVimPlugin {
      name = "comment-nvim";
      src = sources.comment-nvim;
      buildPhase = ":";
    };

    nvim-jqx = vimUtils.buildVimPlugin {
      name = "nvim-jqx";
      src = sources.nvim-jqx;
      buildPhase = ":";
    };

    vim-floaterm = vimUtils.buildVimPlugin {
      name = "vim-floaterm";
      src = sources.vim-floaterm;
      buildPhase = ":";
    };

    lualine-nvim = vimUtils.buildVimPlugin {
      name = "lualine";
      src = sources.lualine-nvim;
      buildPhase = ":";
    };

    bufferline-nvim = vimUtils.buildVimPlugin {
      name = "bufferline-nvim";
      src = sources.bufferline-nvim;
      buildPhase = ":";
    };

    ## Snippet
    luasnip = vimUtils.buildVimPlugin {
      name = "luasnip";
      src = sources.luasnip;
      buildPhase = ":";
    };

    cmp_luasnip = vimUtils.buildVimPlugin {
      name = "cmp_luasnip";
      src = sources.cmp_luasnip;
      buildPhase = ":";
    };

    ##

    vim-terraform = vimUtils.buildVimPlugin {
      name = "vim-terraform";
      src = sources.vim-terraform;
      buildPhase = ":";
    };

    vim-tmux-navigator = vimUtils.buildVimPlugin {
      name = "vim-tmux-navigator";
      src = sources.vim-tmux-navigator;
      buildPhase = ":";
    };

    undotree = vimUtils.buildVimPlugin {
      name = "undotree";
      src = sources.undotree;
      buildPhase = ":";
    };

    vim-fugitive = vimUtils.buildVimPlugin {
      name = "vim-fugitive";
      src = sources.vim-fugitive;
      buildPhase = ":";
    };

    vim-gitgutter = vimUtils.buildVimPlugin {
      name = "vim-gitgutter";
      src = sources.vim-gitgutter;
      buildPhase = ":";
    };

    git-worktree-nvim = vimUtils.buildVimPlugin {
      name = "git-worktree-nvim";
      src = sources.git-worktree-nvim;
      buildPhase = ":";
    };

    popup-nvim = vimUtils.buildVimPlugin {
      name = "popup-nvim";
      src = sources.popup-nvim;
      buildPhase = ":";
    };

    plenary-nvim = vimUtils.buildVimPlugin {
      name = "plenary-nvim";
      src = sources.plenary-nvim;
      buildPhase = ":";
    };

    telescope-nvim = vimUtils.buildVimPlugin {
      name = "telescope-nvim";
      src = sources.telescope-nvim;
      buildPhase = ":";
    };

    telescope-fzy-native-nvim = vimUtils.buildVimPlugin {
      name = "telescope-fzy-native-nvim";
      src = sources.telescope-fzy-native-nvim;
      buildPhase = ":";
    };

    ## Color Schemes
    zephyr-nvim = vimUtils.buildVimPlugin {
      name = "zephyr-nvim";
      src = sources.zephyr-nvim;
      buildPhase = ":";
    };

    material-nvim = vimUtils.buildVimPlugin {
        name = "material-nvim";
        src = sources.material-nvim;
        buildPhase = ":";
    };
    
    ##
        
    ## treesitter and grammars ##
    nvim-treesitter = vimUtils.buildVimPlugin {
      name = "nvim-treesitter";
      src = sources.nvim-treesitter;
    };

    tree-sitter-hcl = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      lanaguage = "hcl";
      version = "0.1.0";
      source = sources.tree-sitter-hcl;
    };

    tree-sitter-python = self.callPackage
    (sources.nixpgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "python";
      version = "0.1.0";
      source = sources.tree-sitter-python;
    };

    tree-sitter-go = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "go";
      version = "0.1.0";
      source = sources.tree-sitter-go;
    };

    tree-sitter-bash = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "bash";
      version = "0.1.0";
      source = sources.tree-sitter-bash;
    };

    tree-sitter-json = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "json";
      version = "0.1.0";
      source = sources.tree-sitter-json;
    };

    tree-sitter-markdown = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "markdown";
      version = "0.1.0";
      source = sources.tree-sitter-markdown;
    };

    tree-sitter-nix = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "nix";
      version = "0.1.0";
      source = sources.tree-sitter-nix;
    };

    tree-sitter-lua = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "lua";
      version = "0.1.0";
      source = sources.tree-sitter-lua;
    };

    tree-sitter-sql = self.callPackage
    (sources.nixpkgs + /pkgs/developement/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "sql";
      version = "0.1.0";
      source = sources.tree-sitter-sql;
    };

    tree-sitter-yaml = self.callPackage
    (sources.nixpkgs + /pkgs/development/tools/parsing/tree-sitter/grammar.nix) { } {
      language = "yaml";
      version = "0.1.0";
      source = sources.tree-sitter-yaml;
    };


    #############################
  };
}
