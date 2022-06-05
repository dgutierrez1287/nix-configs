

" ############  commands.vim  ################

command! VT vsp | terminal 

if has('nvim')
    autocmd TermOpen term://* startinsert
endif