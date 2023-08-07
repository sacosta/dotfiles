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

-- Leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '



local remap_opts = { noremap = true, silent = true }


vim.api.nvim_set_keymap('', '<Space>', '<Nop>', remap_opts)

-- Exit insert mode
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', {})
vim.api.nvim_set_keymap('i', '<C-k>', '<Esc>', {})
vim.api.nvim_set_keymap('i', '<C-n>', '<Esc>', {})

-- Keep cursor in mid screen 
vim.api.nvim_set_keymap('n', '<C-d>', '<C-d>zz', {})
vim.api.nvim_set_keymap('n', '<C-u>', '<C-u>zz', {})
vim.api.nvim_set_keymap('n', '{', '{zz', {})
vim.api.nvim_set_keymap('n', '}', '}zz', {})
vim.api.nvim_set_keymap('n', '*', '*zz', {})
vim.api.nvim_set_keymap('n', '#', '#zz', {})
vim.api.nvim_set_keymap('n', 'n', 'nzz', {})
vim.api.nvim_set_keymap('n', 'N', 'Nzz', {})
vim.api.nvim_set_keymap('n', 'g*', 'g*zz', {})
vim.api.nvim_set_keymap('n', 'g#', 'g#zz', {})

--vim.api.nvim_set_keymap('n', '<leader>nc', ':e! ~/.config/nvim/init.lua<CR>', remap_opts)
-- vim.api.nvim_set_keymap('n', '<leader>nl', ':e! ~/.config/nvim/lua/cnf<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>cn', ':lua require("cnf.telescope").find_nvim_cnf_files()<CR>', remap_opts)

vim.api.nvim_set_keymap('n', '<leader>pf', ':lua require("cnf.telescope").project_find_files()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>ff', ':lua require("cnf.telescope").find_files()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':lua require("cnf.telescope").live_grep()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':lua require("cnf.telescope").buffers()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>ft', ':lua require("cnf.telescope").find_types()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>fs', ':lua require("cnf.telescope").find_workspace_symbols()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>fd', ':lua require("telescope.builtin").diagnostics()<CR>', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>ds', ':lua require("telescope.builtin").lsp_document_symbols()<CR>zz', remap_opts)
vim.api.nvim_set_keymap('n', '<leader>bb', ':e #<CR>', remap_opts)

lsp.setup()


-- Load custom tree-sitter grammar for org filetype
require('orgmode').setup_ts_grammar()


