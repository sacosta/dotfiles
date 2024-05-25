vim.keymap.set('n', '<leader>nt', ':Ex<Cr>')
vim.keymap.set('n', '<leader>u',  vim.cmd.UndoTreeToggle)
vim.keymap.set('n', '<leader>gc', function() require('neogit').open({ kind = "replace" }) end)

vim.keymap.set('n', '<leader>fh', function() require('cnf.telescope').find_help() end)

-- agnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })


vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({'n', 'v'}, "<leader>fc", function()
    print("Text formatted")
	require("conform").format({ async = true, lsp_fallback = true })
end, {noremap = true})
