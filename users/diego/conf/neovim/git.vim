

" ##############  git.vim  ###############


" Git Fugitive

nnoremap <silent> <Leader>gl :Git log<CR>
nnoremap <silent> <leader>gd :Git diff<CR>
nnoremap <silent> <leader>gs :Git status<CR>
nnoremap <silent> <leader>gb :Git blame<CR>
nnoremap <silent> <leader>ga :Git add %<CR><CR>
nnoremap <silent> <leader>gc :Git commit<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Git Gutter
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

let g:gitgutter_override_sign_column_highlight = 1
set updatetime=250
nmap <Leader>gn <Plug>GitGutterNextHunk 
nmap <Leader>gm <Plug>GitGutterPrevHunk