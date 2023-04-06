

" ##########  colors.vim  ##############

lua <<EOF
local material = require 'material'
local colors = require 'material.colors'

material.setup({
    lualine_style = "default",

    custom_highlights = {
        LineNr = { fg = '#FFFF00'},

        YourHighlightGroup = {
            fg = "#FFFF00",
            bold = true,
            underdot = true
        }
    }
})

EOF

let g:material_style = "darker"
colorscheme material
