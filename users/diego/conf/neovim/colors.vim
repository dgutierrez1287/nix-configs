

" ##########  colors.vim  ##############

lua <<EOF
require('material').setup({
    lualine_style = "stealth",
})

vim.cmd 'colorscheme material'
vim.g.material_style = "deep ocean"

vim.api.nvim_set_keymap('n', '<leader>ml', [[<Cmd>lua require('material.functions').change_style('lighter')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>md', [[<Cmd>lua require('material.functions').change_style('deep ocean')<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>mdd', [[<Cmd>lua require('material.functions').change_style('darker')<CR>]], { noremap = true, silent = true })
EOF
