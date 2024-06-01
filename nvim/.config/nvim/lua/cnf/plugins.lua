require('packer').startup(function(use)

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

    -- formatter
    use "stevearc/conform.nvim"

    -- LSP and Tree sitter
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }


    -- RUST
    use 'simrat39/rust-tools.nvim'

    -- Javascript
    use 'MunifTanjim/eslint.nvim'

    -- Git
    use 'kyazdani42/nvim-web-devicons'
    use { 'lewis6991/gitsigns.nvim' }
  end
}
end)
