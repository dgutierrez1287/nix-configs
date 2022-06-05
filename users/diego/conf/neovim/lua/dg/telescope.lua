local actions = require("telescope.actions")
local utils = require("telescope.utils")

require("telescope").load_extension("git_worktree")
require("telescope").load_extension("fzy_native")
require('telescope').load_extension('ultisnips')

-- Helper functions --

-- file_browse_mappings - default mappings used for most file or buffer
-- seach commands (saving from having to copy paste)
local file_browse_mappings = function (prompt_bufnr, map)
    map("i", "<c-s>", actions.select_vertical)
    map("n", "<c-s>", actions.select_vertical)
    map("i", "<c-i>", actions.select_horizontal)
    map("n", "<c-i>", actions.select_horizontal)
    map("i", "<c-t>", actions.select_tab)
    map("n", "<c-t>", actions.select_tab)
    return true
end

-----------------------

-- local table of functions that will be used in the .vim with key mappings
local M = {}

-- buffers --
-- used in place of the stock telescope buffer command with changes to
-- key mappings
M.buffers = function()
    require("telescope.builtin").buffers({
        attach_mappings = function(prompt_bufnr, map)
            map("i", "<c-d>", actions.delete_buffer)
            map("n", "<c-d>", actions.delete_buffer)
            map("i", "<c-s>", actions.select_vertical)
            map("n", "<c-s>", actions.select_vertical)
            map("i", "<c-i>", actions.select_horizontal)
            map("n", "<c-i>", actions.select_horizontal)
            map("i", "<c-t>", actions.select_tab)
            map("n", "<c-t>", actions.select_tab)
            return true
        end
    })
end

-- project_files --
-- uses git_files if you are in a git directory or just find files
-- if you are not in a git repo, 2 purposes 1 command
M.project_files = function ()
    local _, ret = utils.get_os_command_output {
        "git",
        "rev-parse",
        "--is-inside-work-tree",
    }

    local gopts = {}
    local fopts = {}

    gopts.prompt_title = "Git Files"
    gopts.prompt_prefix = "g-->"
    gopts.results_title = "Project Files Results"
    gopts.attach_mappings = file_browse_mappings

    fopts.hidden = true
    fopts.prompt_title = "Files"
    fopts.prompt_prefix = "f-->"
    fopts.results_title = "File Results"
    fopts.file_ignore_patterns = {
        ".vim/",
        ".git/",
        ".node_modules/",
    }
    fopts.attach_mappings = file_browse_mappings

    if ret == 0 then
        require('telescope.builtin').git_files(gopts)
    else
        require('telescope.builtin').find_files(fopts)
    end
end

-- git_branches --
-- uses telescope for interacting with git with some custom keymaps
M.git_branches = function ()
    local opts = {}

    opts.prompt_title = "Git Branches"
    opts.prompt_prefix = ">>"

    opts.attach_mappings = function(prompt_bufnr, map)
        map("i", "<c-d>", actions.git_delete_branch)
        map("n", "<c-d>", actions.git_delete_branch)
        map("i", "<c-s>", actions.git_switch_branch)
        map("n", "<c-s>", actions.git_switch_branch)
        map("i", "<c-a>", actions.git_apply_stash)
        map("n", "<c-a>", actions.git_apply_stash)
        map("i", "<c-c>", actions.git_checkout)
        map("n", "<c-c>", actions.git_checkout)
        map("i", "<c-t>", actions.git_track_branch)
        map("n", "<c-t>", actions.git_track_branch)
        map("i", "<c-r>", actions.git_rebase_branch)
        map("n", "<c-r>", actions.git_rebase_branch)
        map("i", "<c-H>", actions.git_reset_hard)
        map("n", "<c-H>", actions.git_reset_hard)
        return true
    end

    require('telescope.builtin').git_branches(opts)
end

-- return external functions in lua table
return M

