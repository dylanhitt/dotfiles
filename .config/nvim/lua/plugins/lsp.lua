return {
    {
        'williamboman/mason.nvim',
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
            'williamboman/mason.nvim',
        },
        ensure_installed = {
            "gopls"
        }
    },
    {
        'hrsh7th/nvim-cmp',
        config = function()
            local luasnip = require('luasnip')
            local cmp = require('cmp')
            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-u>'] = cmp.mapping.scroll_docs(-4), -- Up
                    ['<C-d>'] = cmp.mapping.scroll_docs(4),  -- Down
                    -- C-b (back) C-f (forward) for snippet placeholder navigation.
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<Tab>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = true,
                    },
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                },
            })
        end,
        dependencies = {
            'saadparwaiz1/cmp_luasnip',
            'L3MON4D3/LuaSnip'
        }
    },
    {
        'hrsh7th/cmp-nvim-lsp'
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            require('mason').setup()

            -- should make this after we have more language
            -- server setups
            local on_attach = function(_, _)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            end

            lspconfig.gopls.setup({
                capabilities = capabilities,
                on_attach = on_attach
            })
        end,
        dependencies = {
            "williamboman/mason.nvim",
            'hrsh7th/cmp-nvim-lsp'
        }
    },
}
