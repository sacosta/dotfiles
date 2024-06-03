local remap_opts = { noremap = true, silent = true }
-- Keep cursor in mid screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', '{', '{zz', {})
vim.keymap.set('n', '}', '}zz', {})
vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>nt', ':Ex<Cr>')

vim.keymap.set('n', '<leader>ff', require("cnf.telescope").find_files, remap_opts)
vim.keymap.set('n', '<leader>fb', require("cnf.telescope").buffers, remap_opts)

-- Keep cursor in mid screen
vim.keymap.set('n', '<C-d>', '<C-d>zz', {})
vim.keymap.set('n', '<C-u>', '<C-u>zz', {})
vim.keymap.set('n', '{', '{zz', {})
vim.keymap.set('n', '}', '}zz', {})
vim.keymap.set('n', '*', '*zz', {})
vim.keymap.set('n', '#', '#zz', {})
vim.keymap.set('n', 'n', 'nzz', {})
vim.keymap.set('n', 'N', 'Nzz', {})
vim.keymap.set('n', 'g*', 'g*zz', {})
vim.keymap.set('n', 'g#', 'g#zz', {})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>nt', ':Ex<Cr>')

-- Telescope

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup("cfn-lsp", { clear = true }),
	callback = function(evt)
		local buf = evt.buf
		local map = function(keys, func, desc)
			vim.keymap.set('n', keys, func, { buffer = buf, desc = 'LSP: ' .. desc })
		end

		-- Jump to the definition of the word under your cursor.
		--  This is where a variable was first declared, or where a function is defined, etc.
		--  To jump back, press <C-t>.
		map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
		map('gD', vim.lsp.buf.declaration, '[G]oto [D]efinition')
		map('<leader>fr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
		map('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

		-- Jump to the type of the word under your cursor.
		--  Useful when you're not sure what type a variable is and you want to see
		--  the definition of its *type*, not where it was *defined*.
		map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

		map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
		map('<leader>ft', require('telescope.builtin').lsp_type_definitions, '[D]ocument [S]ymbols')
		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
		map('<leader>cr', vim.lsp.buf.rename, '[R]e[n]ame')
		map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
		map('<leader>fd', require('telescope.builtin').diagnostics, 'Find Diagnostics')
		map('K', vim.lsp.buf.hover, 'Hover Documentation')
		vim.keymap.set({ "n", "v" }, "<leader>df", function()
			require("conform").format({ async = false, lsp_fallback = true })
			print("Text formatted")
		end, {})
	end
})

vim.keymap.set({ "n", "v" }, "<leader>zz", require("zen-mode").toggle, {})
-- format code
