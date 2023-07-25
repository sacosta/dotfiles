
local cmp = require('cmp')

cmp.setup {
    snippets = {
        expand = function (args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' }
    }),

    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-o>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
}

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources(
  {{ name = 'cmp_git' }}, -- You can specify the `cmp_git` source if you were installed it.
  {{ name = 'buffer' }}
  )
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--cmp.setup.cmdline('/', {
--  mapping = cmp.mapping.preset.cmdline(),
--  sources = {
--    { name = 'buffer' }
--  }
--})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


local capabilities = require('cmp_nvim_lsp').default_capabilities()
local servers = {
    'rust_analyzer',
    'clangd',
    'tsserver',
    'lua_ls',
    'html',
    'tailwindcss',
    'sqlls',
    'jsonls',
}

local lspconfig = require('lspconfig')
for _, server in pairs(servers) do
    lspconfig[server].setup {
        capabilities = capabilities
    }
end

