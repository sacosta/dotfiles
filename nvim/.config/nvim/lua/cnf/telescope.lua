require('telescope').setup({
    defaults = {
        layout_strategy = 'center'
    }
})

local ignore_patterns = { 'node_modules', 'plugged', 'dist' }

local builtin = require('telescope.builtin')
local themes = require('telescope.themes')

local M = {}

M.project_find_files = function()
    builtin.git_files({
        file_ignore_patterns = ignore_patterns,
		preview = false,
		theme = 'get_cursor',
		layout_strategy = 'center',
    })
end

M.find_files = function ()
    builtin.find_files({
        file_ignore_patterns = ignore_patterns,
    })
end

M.live_grep = function ()
    builtin.live_grep()
end

M.buffers = function ()
    builtin.buffers()
end

-- Find by class/struct name just like IntelliJ
M.find_types = function ()
    builtin.lsp_workspace_symbols(themes.get_ivy({
        ignore_patterns = { "automock" },
        theme = 'get_cursor',
        frame_width = 900,
        symbol_width = 50,
        symbol_type_width = 12,
        symbols = { "struct", "interface", "class" }
    }))
end

M.find_workspace_symbols = function ()
    builtin.lsp_workspace_symbols()
end

M.find_nvim_cnf_files = function ()
    builtin.find_files({
        cwd = vim.fn.stdpath('config'),
        hidden = false,
    })
end

M.find_help = function ()
     builtin.help_tags()
end


return M

