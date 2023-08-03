vim.keymap.set("n", "<leader>zz", function()
    local zenmode = require("zen-mode")
    zenmode.setup {
        window = {
            backdrop = 0.85,
            width = 120
        },
        plugins = {
            alacritty = {
                enabled = true,
                font = "20", -- font size
            }
        }
    }
    zenmode.toggle()

    vim.api.nvim_command('colorscheme base16-ocean')

    -- Transparent background
    vim.api.nvim_command('highlight Normal guibg=none')
    vim.api.nvim_command('highlight NonText guibg=none')
end)


