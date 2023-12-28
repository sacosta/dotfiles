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
--vim.api.nvim_command('colorscheme base16-ocean')
vim.api.nvim_command('colorscheme catppuccin-mocha')

-- Transparent background
--vim.api.nvim_command('highlight Normal guibg=none')
--vim.api.nvim_command('highlight NonText guibg=none')
