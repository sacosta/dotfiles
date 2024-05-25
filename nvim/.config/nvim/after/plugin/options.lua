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
vim.opt.colorcolumn = { 120 }

vim.g.have_nerd_font = true

vim.opt.updatetime = 250
-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10


-- vim.opt.rrtp='/opt/homebrew/opt/fzf'

-- Use spaces as tabs
vim.opt.expandtab = true

-- vim.api.nvim_command('colorscheme base16-solarized-dark')
--vim.api.nvim_command('colorscheme base16-gruvbox-dark-hard')
-- vim.api.nvim_command('colorscheme gruvbox')
-- vim.api.nvim_command('colorscheme base16-nord')
--vim.api.nvim_command('colorscheme base16-ocean')
vim.api.nvim_command('colorscheme catppuccin-mocha')
-- vim.api.nvim_command('colorscheme catppuccin-latte')

-- Transparent background
-- vim.api.nvim_command('highlight Normal guibg=none')
-- vim.api.nvim_command('highlight NonText guibg=none')
