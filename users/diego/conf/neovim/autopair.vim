

"  ######## autopair.vim ###########

lua <<EOF
local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.setup {
    disable_filetype = { "TelescopePrompt" },
}

npairs.add_rules({
    Rule('"', '"', "-vim"),
})
EOF


