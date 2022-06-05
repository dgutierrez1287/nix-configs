
local sumneko_root_path = '/home/diego/utils/lsp/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local function on_attach()

end

-- lsp signature help
require 'lsp_signature'.setup({
    bind = true,
    handler_opts = {
        border = "single"
    }
})

-- typescript
-- install --> :LspInstall typescript
require'lspconfig'.tsserver.setup{ on_attach=on_attach }

-- golang language
-- install --> :LspInstall go
require'lspconfig'.gopls.setup{
    on_attach = on_attach,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- bash language
-- install --> :LspInstall bash
require'lspconfig'.bashls.setup{
    on_attach = on_attach,
}

-- python language
-- install --> :LspInstall python
require'lspconfig'.pyright.setup{
    on_attach = on_attach,
}

-- vim language
-- install --> :LspInstall vim
require'lspconfig'.vimls.setup {
    on_attach = on_attach,
}

-- lua language
-- install --> see vim-deps.sh
require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
                },
            },
        },
    },
}

-- terraform language
-- install --> :LspInstall terraform
require'lspconfig'.terraformls.setup {
    on_attach = on_attach,
}

-- docker language
-- install --> npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup {
    on_attach = on_attach,
    filetypes = { "Dockerfile", "dockerfile", "*-Dockerfile"}
} 

-- todo: install later

-- ansible language


-- json language


-- yaml langauge

-- java language 

-- groovy langauge


-- sql language

-- latex language
