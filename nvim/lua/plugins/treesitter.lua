return {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",

    config = function()
        local ts = require("nvim-treesitter")

        ts.setup({
            ensure_installed = {
                "c",
                "cpp",
                "cuda",
                "rust",
                "go",
                "gomod",
                "gowork",
                "lua",
                "python",
                "html",
                "javascript",
                "typescript",
                "tsx",
                "css",
                "dockerfile",
                "json",
                "jsonc",
                "yaml",
                "sql",
                "markdown",
                "markdown_inline",
                "bash",
                "vim",
                "vimdoc",
                "query",
                "regex",
                "luadoc",
            },
            sync_install = false,
            auto_install = true,
        })

        vim.api.nvim_create_autocmd("FileType", {
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
            end,
        })
    end,
}
