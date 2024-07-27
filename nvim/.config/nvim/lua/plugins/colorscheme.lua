return {
  --colorschemes
  { 'folke/tokyonight.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'RRethy/base16-nvim',
    config = function ()
      vim.cmd([[colorscheme base16-everforest]])
    end
  },
  { 
    'ellisonleao/gruvbox.nvim',
  --  config = function()
 --      vim.cmd([[colorscheme gruvbox]])
  --  end
  },
}
