
--local sumneko_root_path = '/home/diego/utils/lsp/lua-language-server'
--local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

--- lsp kind
require'lspkind'.init({})

local nvim_lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...) end

    -- Mappings
    local opts = { noremap=true, silent=true }

    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
end

-- lsp signature help
require 'lsp_signature'.setup({
    bind = true,
    handler_opts = {
        border = "single"
    }
})

-- typescript
nvim_lsp.tsserver.setup{ on_attach=on_attach }

-- golang language
nvim_lsp.gopls.setup{
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

-- nix language
nvim_lsp.rnix.setup {
    on_attach = on_attach
}

-- bash language
nvim_lsp.bashls.setup{
    on_attach = on_attach,
}

-- python language
nvim_lsp.pyright.setup{
    on_attach = on_attach,
}

-- vim language
nvim_lsp.vimls.setup {
    on_attach = on_attach,
}

-- lua language
nvim_lsp.sumneko_lua.setup {
    on_attach = on_attach,
 --   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
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
nvim_lsp.terraformls.setup {
    on_attach = on_attach,
}

-- docker language
-- install --> npm install -g dockerfile-language-server-nodejs
nvim_lsp.dockerls.setup {
    on_attach = on_attach,
    filetypes = { "Dockerfile", "dockerfile", "*-Dockerfile"}
}

-- todo: install later

-- ansible language

-- diagnostic language server
nvim_lsp.diagnosticls.setup{}

-- json language


-- yaml langauge
nvim_lsp.yamlls.setup{}

-- java language 
nvim_lsp.java_language_server.setup{}

-- groovy langauge


-- sql language

-- latex language
