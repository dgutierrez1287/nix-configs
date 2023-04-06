

" #################  lsp.vim  ##################


lua require("dg.lsp")

autocmd BufWritePre *.tfvars lua vim.lsp.buf.formatting_sync()
autocmd BufWritePre *.tf lua vim.lsp.buf.formatting_sync()


