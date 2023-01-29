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


vim.opt.filetype = 'on'
vim.opt.shell = '/bin/zsh'
vim.opt.mouse = 'a'
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.hidden = true
vim.opt.termguicolors = true
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.wildignore = { 'node_modules' }

-- Use spaces as tabs
vim.opt.expandtab = true

-- vim.api.nvim_command('colorscheme base16-solarized-dark')
-- vim.api.nvim_command('colorscheme base16-gruvbox-dark-hard')
-- vim.api.nvim_command('colorscheme base16-nord')
vim.api.nvim_command('colorscheme base16-ocean')

-- Transparent background
vim.api.nvim_command('highlight Normal guibg=none')
vim.api.nvim_command('highlight NonText guibg=none')

local remap_opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', remap_opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

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

-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

local neogit = require('neogit')
neogit.setup {
  disable_signs = false,
  disable_hint = false,
  disable_context_highlighting = false,
  disable_commit_confirmation = false,
  -- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size. 
  -- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
  auto_refresh = true,
  disable_builtin_notifications = false,
  use_magit_keybindings = false,
  -- Change the default way of opening neogit
  -- kind = "tab",
  -- Change the default way of opening the commit popup
  commit_popup = {
    kind = "split",
  },
  -- Change the default way of opening popups
  popup = {
    kind = "split",
  },
  -- customize displayed signs
  signs = {
    -- { CLOSED, OPENED }
    section = { ">", "v" },
    item = { ">", "v" },
    hunk = { "", "" },
  },
  integrations = {
    diffview = true
  },
  -- Setting any section to `false` will make the section not render at all
  sections = {
    untracked = {
      folded = false
    },
    unstaged = {
      folded = false
    },
    staged = {
      folded = false
    },
    stashes = {
      folded = true
    },
    unpulled = {
      folded = true
    },
    unmerged = {
      folded = false
    },
    recent = {
      folded = true
    },
  },
  -- override/add mappings
  mappings = {
    -- modify status buffer mappings
    status = {
      -- Adds a mapping with "B" as key that does the "BranchPopup" command
      ["B"] = "BranchPopup",
      -- Removes the default mapping of "s"
      ["s"] = "",
    }
  }
}

