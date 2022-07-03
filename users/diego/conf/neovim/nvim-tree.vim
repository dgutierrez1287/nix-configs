


" ################### nvim-tree.vim ##################

" lua config for nvim-tree
lua <<EOF
require'nvim-tree'.setup {
    view = {
        mappings = {
            list = {
                {key = "s", action = "vsplit"},
                {key = "i", action = "split"},
            },
        },
        hide_root_folder = true,
    },
}
EOF


" toggle
nnoremap <Leader>nt :NvimTreeToggle<CR>

