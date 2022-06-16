

" ################### nvim-tree.vim ##################

" lua config for nvim-tree
lua <<EOF
require'nvim-tree'.setup {
    view = {
        mappings = {
            list = {
            }
        }
    }
}
EOF


" toggle
nnoremap <Leader>nt :NvimTreeToggle<CR>

" Open in Split
"nnoremap <s> :vsplit<CR>
nnoremap <Leader>h :split<CR>
