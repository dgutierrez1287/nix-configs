

" #################### nvim-cmp ####################

" lua config for nvim-cmp
lua <<EOF
local cmp = require'cmp'

cmp.setup({
    mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-o>"] = cmp.mapping.complete(),
        ["<C-l>"] = cmp.mapping.close(),
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-e>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
                -- they way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),
    },
    formatting = {
      format = function(_, vim_item)
         vim.cmd("packadd lspkind-nvim")
         vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
         .. "  "
         .. vim_item.kind
         return vim_item
      end,
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "path" },
      { name = "buffer" },
      { name = "luasnip" },
   },
   snippet = {
    expand = function(args)
        local luasnip = prequire("luasnip")
        if not luasnip then
            return
        end
        luasnip.lsp_expand(args.body)
    end,
    },
})

EOF

