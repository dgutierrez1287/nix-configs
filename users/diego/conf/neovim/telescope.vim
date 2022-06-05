

" #################  telescope.vim  ##################

lua require("dg.telescope")

nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pf :lua require'dg.telescope'.project_files()<CR>
nnoremap <leader>pb :lua require('dg.telescope').buffers()<CR>
nnoremap <Leader>pl :lua require('telescope.builtin').live_grep()<CR>

nnoremap <Leader>br :lua require('dg.telescope').git_branches()<CR>

nnoremap <Leader>us :lua require'telescope'.extensions.ultisnips.ultisnips{}<CR>