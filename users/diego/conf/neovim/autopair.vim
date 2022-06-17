

"  ######## autopair.vim ###########

"inoremap \" \""<left>
"cinoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>
""inoremap < <><left>
""inoremap {<CR> {<CR>}<ESC>O
""inoremap {;<CR> {<CR>};<ESC>O
""inoremap [<CR> [<CR>]<ESC>O

lua <<EOF
require'nvim-autopairs'.setup {
    disable_filetype = { "TelescopePrompt", "vim" },
}
EOF
