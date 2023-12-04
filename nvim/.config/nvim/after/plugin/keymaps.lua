vim.keymap.set('n', '<leader>nt', ':Ex<Cr>')
vim.keymap.set('n', '<leader>u',  vim.cmd.UndoTreeToggle)
vim.keymap.set('n', '<leader>gc', function() require('neogit').open({ kind = "replace" }) end)

vim.keymap.set('n', '<leader>fh', function() require('cnf.telescope').find_help() end)
