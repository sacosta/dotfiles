vim.keymap.set('n', '<leader>zz', function()
    local zen = require('zen-mode');
    zen.setup {
       --[[
        window = {
            width = 250,
            }
        ]]-- 
    }
    zen.toggle()
end)
