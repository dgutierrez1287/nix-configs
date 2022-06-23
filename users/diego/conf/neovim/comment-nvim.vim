
" ###################### Comment.nvim #####################

lua <<EOF
require('Comment').setup()

local opt = { expr = true, remap = true}

-- toggle using count
vim.keymap.set('n', '<Leader>cc', "v:count == 0 ? '<Plug>(comment_toggle_current_linewise)' : '<Plug>(comment_toggle_linewise_count)'", opt)
vim.keymap.set('n', '<Leader>cb', "v:count == 0 ? '<Plug>(comment_toggle_current_blockwise)' : '<Plug>(comment_toggle_blockwise_count)'", opt)

-- toggle using visual mode
vim.keymap.set('x', '<Leader>cc', '<Plug>(comment_toggle_linewise_visual)')
vim.keymap.set('x', '<Leader>cb', '<Plug>(comment_toggle_blockwise_visual)')

EOF
