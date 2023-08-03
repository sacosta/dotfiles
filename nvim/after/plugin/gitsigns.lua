require('gitsigns').setup {
    on_attach = function(bufnr)
        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map('n', '<leader>gb', function() require('gitsigns').gs_blame { full = true } end)
    end
}

