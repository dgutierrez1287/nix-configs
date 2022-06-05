

" ############### float-term.vim #################


" new terminal
nnoremap <silent> <Leader>f :FloatermNew<CR>
" noremap! <silent><leader>ft  <Esc>:FloatermNew<CR>
tnoremap <silent><c-f>  <C-\><C-n>:FloatermNew<CR>

" toggle
nnoremap  <silent> <leader>t :FloatermToggle<CR>
" noremap! <silent><leader>t  <Esc>:FloatermToggle<CR>
tnoremap <silent><c-t>  <C-\><C-n>:FloatermToggle<CR>

" Next 
" nnoremap  <silent><leader>tn  :FloatermNext<CR>
" noremap! <silent><leader>tn  <Esc>:FloatermNext<CR>
tnoremap <silent><c-o>  <C-\><C-n>:FloatermNext<CR>

" Previous
" nnoremap  <silent><leader>tp  :FloatermPrev<CR>
" noremap! <silent><leader>tp  <Esc>:FloatermPrev<CR>
tnoremap <silent><c-p>  <C-\><C-n>:FloatermPrev<CR>

" Kill
" nnoremap  <silent><leader>tk  :FloatermKill<CR>
" noremap! <silent><leader>tk  <Esc>:FloatermKill<CR>
tnoremap <silent><c-k>  <C-\><C-n>:FloatermKill<CR>

" Normal mode
tnoremap <silent><c-n> <C-\><C-n>