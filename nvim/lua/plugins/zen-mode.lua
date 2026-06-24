-- Lua
return {
	--	{
	--		"folke/zen-mode.nvim",
	--		opts = {
	--			window = {
	--				backdrop = 0.95, -- 0 significa que el fondo detrás del modo zen es 100% transparente
	--			},
	--
	--			plugins = {
	--				alacritty = {
	--					enabled = false,
	--					font = 14,
	--				},
	--			},
	--		},
	--	},
	{
		"folke/zen-mode.nvim",
		opts = {
			window = {
				backdrop = -1, -- 💡 IMPORTANTE: -1 apaga por completo el sombreado negro del plugin
				width = 120, -- Ancho de la ventana de código
				options = {
					signcolumn = "no",
					number = false,
					relativenumber = false,
				},
			},
			-- Forzamos a que tanto la ventana de código como el fondo sean transparentes
			on_open = function(win)
				vim.api.nvim_set_hl(0, "ZenBg", { bg = "none", ctermbg = "none" })
				vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
			end,
		},
	},
}
