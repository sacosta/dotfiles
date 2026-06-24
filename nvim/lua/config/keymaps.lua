vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Keep cursor in mid screen
map("n", "<C-d>", "<C-d>zz", {})
map("n", "<C-u>", "<C-u>zz", {})
map("n", "{", "{zz", {})
map("n", "}", "}zz", {})
map("n", "*", "*zz", {})
map("n", "#", "#zz", {})
map("n", "n", "nzz", {})
map("n", "N", "Nzz", {})
map("n", "g*", "g*zz", {})
map("n", "g#", "g#zz", {})

-- set an easy way to remove highlights
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>nt", ":Ex<Cr>")

-- alternate buffers
map("n", "<leader>bb", "<C-^>", {})

-- use tmuxf to find projetct in ~/development
map("n", "<C-p>", "<cmd>silent !tmuxf neww tmuxf<CR>", { desc = "Search projects in ~/development" })

-- find config files
map("n", "<leader>cn", function()
	require("snacks").picker.files({
		path = "~/.config/nvim",
	})
end)

map("i", "<C-Space>", function()
	local blink = require("blink.cmp")
	blink.show({})
end, { desc = "Launch autocomplete" })

--- === Section: LSP === 
vim.api.nvim_create_autocmd({ "LspAttach" }, {
	callback = function(evt)
		map("n", "<leader>fd", function()
			require("snacks").picker.diagnostics()
		end, {})
		--local buf = evt.buf
		--local picker = require('snacks').picker

		---- Jump to the definition of the word under your cursor.
		----  This is where a variable was first declared, or where a function is defined, etc.
		----  To jump back, press <C-t>.
		--map('n', 'gd', picker.lsp_definitions, { buffer = buf, desc = 'LSP: [G]oto [D]efinition'})
		--map('n', 'gD', vim.lsp.buf.declaration, '[G]oto [D]efinition')
		--map('n', '<leader>fr', picker.lsp_references, '[G]oto [R]eferences')
		--map('gI', picker.lsp_implementations, '[G]oto [I]mplementation')

		---- Jump to the type of the word under your cursor.
		----  Useful when you're not sure what type a variable is and you want to see
		----  the definition of its *type*, not where it was *defined*.
		--map('<leader>D', picker.lsp_type_definitions, 'Type [D]efinition')

		--map('<leader>ds', picker.lsp_document_symbols, '[D]ocument [S]ymbols')
		--map('<leader>ft', picker.lsp_type_definitions, '[D]ocument [S]ymbols')
		---- Fuzzy find all the symbols in your current workspace.
		----  Similar to document symbols, except searches over your entire project.
		--map('<leader>ws', picker.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
		map("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
		map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
		map("n", "<leader>gI", function() 
		  Snacks.picker.lsp_implementations()
		end, {desc = "Goto Implementations"})
		--map('<leader>fd', picker.diagnostics, 'Find Diagnostics')
		--map('K', vim.lsp.buf.hover, 'Hover Documentation')
		--map({ "n", "v" }, "<leader>df", function()
		--	require("conform").format({ async = false, lsp_fallback = true })
		--	print("Text formatted")
		--end, {})
	end,
})

-- Top Pickers & Explorer
map("n", "<leader><space>", function()
	Snacks.picker.smart()
end, { desc = "Smart Find Files" })
map("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>e", function()
	Snacks.explorer()
end, { desc = "File Explorer" })
-- find
map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>fc", function()
	Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })
map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })
map("n", "<leader>fr", function()
	Snacks.picker.lsp_references()
end, { desc = "Recent" })
-- git
map("n", "<leader>gb", function()
	Snacks.picker.git_branches()
end, { desc = "Git Branches" })
map("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })
map("n", "<leader>gL", function()
	Snacks.picker.git_log_line()
end, { desc = "Git Log Line" })
map("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })
map("n", "<leader>gS", function()
	Snacks.picker.git_stash()
end, { desc = "Git Stash" })
map("n", "<leader>gd", function()
	Snacks.picker.git_diff()
end, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", function()
	Snacks.picker.git_log_file()
end, { desc = "Git Log File" })

-- Grep
map("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
-- search
map("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })
map("n", "<leader>s/", function()
	Snacks.picker.search_history()
end, { desc = "Search History" })
map("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })
map("n", "<laeder>fa", function()
	Snacks.picker.commands()
end, { desc = "Commands" })
map("n", "<leader>ca", function()
	lsp.buf.code_action()
end, { desc = "Code actions" })
map("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>sD", function()
	Snacks.picker.diagnostics_buffer()
end, { desc = "Buffer Diagnostics" })
map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })
map("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })
map("n", "<leader>si", function()
	Snacks.picker.icons()
end, { desc = "Icons" })
map("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })
map("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })
map("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })
map("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })
map("n", "<leader>sp", function()
	Snacks.picker.lazy()
end, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })
map("n", "<leader>sR", function()
	Snacks.picker.resume()
end, { desc = "Resume" })
map("n", "<leader>su", function()
	Snacks.picker.undo()
end, { desc = "Undo History" })
map("n", "<leader>uC", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
-- LSP
map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
map("n", "gD", function()
	Snacks.picker.lsp_declarations()
end, { desc = "Goto Declaration" })
map("n", "gr", function()
	Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
map("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
map("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
map("n", "gai", function()
	Snacks.picker.lsp_incoming_calls()
end, { desc = "C[a]lls Incoming" })
map("n", "gao", function()
	Snacks.picker.lsp_outgoing_calls()
end, { desc = "C[a]lls Outgoing" })
map("n", "<leader>ds", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
map("n", "<leader>ft", function()
	Snacks.picker.lsp_workspace_symbols()
end, { desc = "LSP Workspace Symbols" })
-- Other
map("n", "<leader>.", function()
	Snacks.scratch()
end, { desc = "Toggle Scratch Buffer" })
map("n", "<leader>S", function()
	Snacks.scratch.select()
end, { desc = "Select Scratch Buffer" })
map("n", "<leader>n", function()
	Snacks.notifier.show_history()
end, { desc = "Notification History" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename File" })

map("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
map({ "n", "t" }, "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map({ "n", "t" }, "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })
map("n", "<leader>N", function()
	Snacks.win({
		file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
		width = 0.6,
		height = 0.6,
		wo = {
			spell = false,
			wrap = false,
			signcolumn = "yes",
			statuscolumn = " ",
			conceallevel = 3,
		},
	})
end, { desc = "Neovim News" })
-- Neogit
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Show Neogit UI" })

map("n", "<leader>zz", function()
	require("zen-mode").toggle()
end, {})

map("n", "<leader>df", function()
	require("conform").format()
end, {})

--- === SECTION: GIT === ---
map({ "n", "v" }, "<Leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" })
map({ "n", "v" }, "<Leader>gr", function() require("gitsigns").reset_hunk() end, { desc = "Preview hunk" })
map({ "n", "v" }, "<Leader>gc", "<cmd>Neogit<cr>", { desc = "Preview hunk" })


-- === SECTION: Coding Agent === ---
map({ "n", "v" }, "<Leader>aa", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
map({ "n", "v" }, "<Leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
map({ "n", "v" }, "<Leader>ap", "<cmd>CodeCompanion<cr>", { noremap = true, silent = true })
map("v", "<leader>as", "<cmd>CodeCompanionChat Add<CR>", { desc = "Send selection to AI chat" })

--vim.cmd.nvim_create_autocmd ({
--  'LspAttach'
--},{ callback = function (ev)
--  local client = vim.lsp.get_client_by_id(ev.data.client_id);
--  map("n", "<leader>fd", function()
--	local opts = {}
--	require("snacks").picker.diagnostics()
--  end)
--  end
--})
--
--vim.cmd.nvim_create_autocmd({ 'LspAttach' }, {
--  callback = function()
--	vim.nvim.set("n", "<leader>fd", vim.lsp.diagnostic())
--  end

--})
--
--:
