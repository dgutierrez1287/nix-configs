self: super:

let sources = import ../../../../../nix/sources.nix; in rec {
    customVim = with self; {
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
        };

    };
}
