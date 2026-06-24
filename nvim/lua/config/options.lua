-- allow ctrl-v and ctrl-p when yanking
vim.opt.clipboard:append("unnamedplus")

vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.shiftwidth=2
vim.opt.tabstop=4
vim.opt.cursorline=true -- highlight current cursor
vim.opt.mouse='a' -- allow mouse integration
vim.opt.hidden=true -- don't unload buffer when hidden
vim.opt.termguicolors=true
vim.opt.updatetime=250

-- show some special character
vim.opt.listchars:append({
  tab = "» ",       -- Show tabs as »
  trail = "·",      -- Show trailing spaces as dots
  nbsp = "␣",       -- YOUR CHOICE: The non-breaking space symbol
  extends = "»",    -- Symbol when a line continues off-screen (right)
  precedes = "«",   -- Symbol when a line continues off-screen (left)
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
})

