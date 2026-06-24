return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		--		init = function()
		--			vim.cmd([[colorscheme tokyonight-storm]])
		--		end,
	},
	{
		"shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		config = function()
			require("ayu").setup({
				mirage = true,
				terminal = false,
			})
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		config = true,
		priority = 1000,
		init = function()
		  --vim.cmd([[colorscheme gruvbox]])
		end,
	},
}
