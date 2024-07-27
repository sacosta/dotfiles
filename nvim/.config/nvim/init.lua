require("cnf.lazy")
require("cnf.keymaps")
require("lazy").setup("plugins", {
	checker = {
		notify = false,
	},
	install = {
		missing = true,
	},
})

vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank({ timeout = 300 })
	end,
})
