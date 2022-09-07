require('telescope').setup({
    defaults = {
        layout_strategy = 'center'
    }
})

local ignore_patterns = { 'node_modules', 'plugged', 'dist' }

local builtin = require('telescope.builtin')

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
    builtin.lsp_type_definitions({
    })
end

return M

