

" ##############  nerdtree.vim  #################


" autocmds for nerd tree
augroup nerdtree_cmds
  autocmd!
  " open nerd tree automatically when you open a directory in vim
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  " closing nerdtree
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" toggle 
nnoremap <Leader>nt :NERDTreeToggle<Enter>

" clean up buffers when delete file
let NERDTreeAutoDeleteBuffer = 1

" simplify the ui
let NERDTreeMinimalUI = 1

" hidden files
let NERDTreeShowHidden = 1

let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowIgnored = 1