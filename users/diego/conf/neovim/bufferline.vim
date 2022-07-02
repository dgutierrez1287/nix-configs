
" ###################### Bufferline #####################

set termguicolors
lua <<EOF
require('bufferline').setup{
    options = {
        numbers = "buffer_id",
        show_buffer_close_icons = false,
    }
}
EOF

nnoremap <silent><Leader>bn :BufferLineCycleNext<CR>
nnoremap <silent><Leader>bp :BufferLineCyclePrev<CR>

nnoremap <silent><Leader>bf :BufferLineMoveNext<CR>
nnoremap <silent><Leader>bb :BufferLineMovePrev<CR>


