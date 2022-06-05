

" ############### general.vim ###############

" line numbers
set number relativenumber

" leader
let mapleader = " "

" general
syntax on
set incsearch
set scrolloff=8
set termguicolors

" swap undo backup
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" spacing
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap

" splits
set splitbelow splitright

" adjusting splits
nnoremap <silent> <C-Right> :vertical resize +3<CR>
nnoremap <silent> <C-Left> :vertical resize -3<CR>
nnoremap <silent> <C-Up> :resize +3<CR>
nnoremap <silent> <C-Down> :resize -3<CR>

" toggle highlight search
map <silent> <leader>h :set hlsearch!<cr>
nnoremap <silent> <esc> :noh<return><esc>

" newline without insert
nmap <C-o> O<Esc>j
nmap <CR> o<Esc>k

" open empty splits
nnoremap <C-s> :vnew<CR>
nnoremap <C-i> :new<CR>

" set column
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=brown