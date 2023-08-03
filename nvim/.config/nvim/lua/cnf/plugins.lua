require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'

    use 'NoahTheDuke/vim-just'

    -- Required by cmp
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

    use 'sbdchd/neoformat'


    -- LSP and Tree sitter
    use { "williamboman/mason.nvim" }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Debug
    use 'mfussenegger/nvim-dap'

    -- RUST
    use 'simrat39/rust-tools.nvim'

    -- Javascript
    use 'MunifTanjim/eslint.nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-ui-select.nvim'

    -- UI
    use 'itchyny/lightline.vim'
    use 'machakann/vim-highlightedyank'
    use 'andymass/vim-matchup'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }
    use 'folke/zen-mode.nvim'

    -- Theme
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'chriskempson/base16-vim'

    use {'nvim-orgmode/orgmode',
        config = function()
            require('orgmode').setup{}
        end
    }

    -- Git
    use 'kyazdani42/nvim-web-devicons'
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
    use { 'lewis6991/gitsigns.nvim' }

    -- orgnization
    use {
        'phaazon/mind.nvim',
        branch = 'v2',
        requires = { 'nvim-lua/plenary.nvim' },
        configure = function()
        require'mind'.setup()

    -- utils
    use 'mbbill/undotree'
  end
}
end)
