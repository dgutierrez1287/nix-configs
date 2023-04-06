lua <<EOF
---------------------------------------------------------------------
-- add our custom treesitter parsers
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

---------------------------------------------------------------------
-- Add our treesitter textobjects
require'nvim-treesitter.configs'.setup {
  hightlight = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "yaml",
    "json",
    "bash",
    "dockerfile",
    "go",
    "gomod",
    "java",
    "make",
    "latex",
    "lua",
    "markdown",
    "nix",
    "python",
    "ruby",
    "rust",
    "hcl",
    "typescript",
    "vim",
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}

-- filetype to parser mapping
vim.filetype.add({extensions = {sh = "bash"}})
vim.filetype.add({extensions = {tf = "hcl"}})
EOF
