return {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				rust = { "rustfmt", lsp_format = "fallback" },
				-- Para C y CUDA (NVIDIA)
				c = { "clang-format" },
				cpp = { "clang-format" },
				cuda = { "clang-format" },

				-- Para Python (IA / Data Science con CUDA)
				python = { "ruff_format", "black" },
			},
		},
	},
}
