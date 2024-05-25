-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('cnf.plugins')
require('cnf.telescope')
require('cnf.rust')
require('cnf.autocomplete')
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
local lsp = require('cnf.lsp')
lsp.setup()

local remap_opts = { noremap = true, silent = true }

-- Exit insert mode
vim.keymap.set('i', 'jk', '<Esc>', {})
vim.keymap.set('i', '<C-k>', '<Esc>', {})
vim.keymap.set('i', '<C-n>', '<Esc>', {})

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

vim.keymap.set('n', '<leader>cn', ':lua require("cnf.telescope").find_nvim_cnf_files()<CR>', remap_opts)
vim.keymap.set('n', '<leader>pf', ':lua require("cnf.telescope").project_find_files()<CR>', remap_opts)
vim.keymap.set('n', '<leader>ff', ':lua require("cnf.telescope").find_files()<CR>', remap_opts)
vim.keymap.set('n', '<leader>fg', ':lua require("cnf.telescope").live_grep()<CR>', remap_opts)
vim.keymap.set('n', '<leader>fb', ':lua require("cnf.telescope").buffers()<CR>', remap_opts)
vim.keymap.set('n', '<leader>ft', ':lua require("cnf.telescope").find_types()<CR>', remap_opts)
vim.keymap.set('n', '<leader>fs', function() require('cnf.telescope').find_workspace_symbols() end, remap_opts)
vim.keymap.set('n', '<leader>fd', ':lua require("telescope.builtin").diagnostics()<CR>', remap_opts)
vim.keymap.set('n', '<leader>ds', ':lua require("telescope.builtin").lsp_document_symbols()<CR>zz', remap_opts)
vim.keymap.set('n', '<leader>bb', ':e #<CR>', remap_opts)
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


vim.keymap.set("", "<leader>f", function()
    print("Text formatted")
	require("conform").format({ async = true, lsp_fallback = true })
end, {noremap = true})


