return {
	-- lazy.nvim
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		opts = {
			log_level = "DEBUG", -- or "TRACE"
			display = {
				chat = {
					window = {
						layout = "vertical",
						position = "right",
						width = 0.30, -- 30% del ancho
						full_height = true,
						border = "rounded",
					},
				},
			},
			adapters = {
				http = {
					ollama = function()
						return require("codecompanion.adapters").extend("ollama", {
							env = {
								url = "http://local-ai-dev.sacosta.es:11434",
								api_key = "OLLAMA_API_KEY",
							},
							headers = {
								["Content-Type"] = "application/json",
								["Authorization"] = "Bearer ${api_key}",
							},
							parameters = {
								sync = true,
							},
						})
					end,
				},
			},

			interactions = {
				chat = { adapter = "opencode" },
				inline = { adapter = "ollama" },
				--cmd = { adapter = "opencode" },
			},
		},
	},
}
