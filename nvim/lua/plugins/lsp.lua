return {
	{
		"mason-org/mason.nvim",
		event = "VeryLazy",
		opts = {
			PATH = "prepend",
		},
		dependencies = {
			{ "mason-org/mason-lspconfig.nvim" },
			{ "neovim/nvim-lspconfig" }, -- this is here so tailwind lsp shutups
		},
		config = function()
			require("mason").setup({
				PATH = "prepend",
			})

			local servers = require("config.lsp-servers")

			local ensure_installed = {}
			for _, srv in ipairs(servers) do
				table.insert(ensure_installed, srv.id)
			end

			require("mason-lspconfig").setup({
				ensure_installed = ensure_installed,
				automatic_enable = true,
			})

			local function get_capabilities()
				local capabilities = vim.lsp.protocol.make_client_capabilities()
				local has_blink, blink = pcall(require, "blink.cmp")
				if has_blink then
					capabilities = blink.get_lsp_capabilities(capabilities)
				end
				return capabilities
			end

			local group = vim.api.nvim_create_augroup("LspLazyLoad", { clear = true })
			local caps = get_capabilities()

			-- Recorre la tabla de servers y configura sus capacidades lsp
			for _, lsp in ipairs(servers) do
				vim.api.nvim_create_autocmd("FileType", {
					group = group,
					pattern = lsp.filetypes,
					callback = function(args)
						-- Encuentra el directorio raíz buscando hacia arriba (.jj tiene prioridad si está presente)
						local root_dir = vim.fs.root(args.buf, lsp.root_files)

						-- Activa el LSP correspondiente
						if lsp.enable then
							vim.lsp.enable(lsp.id, {
								capabilities = caps,
								root_dir = root_dir,
							})
						end
					end,
				})
			end
		end,
	},
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
