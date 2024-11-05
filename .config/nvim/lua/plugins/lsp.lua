local v = vim

return {
    {
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = { 'gopls', 'lua-language-server', 'htmx-lsp', "templ" }
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
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
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

            local on_attach = function(_, _)
                v.keymap.set('n', 'K', v.lsp.buf.hover, {})
                v.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
                v.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
            end

            -- should make this configurable after we have more language
            -- server setups
            local lsps = { 'gopls', 'lua_ls', "htmx", "templ" }
            for _, lsp in ipairs(lsps) do
                lspconfig[lsp].setup({
                    capabilities = capabilities,
                    on_attach = on_attach
                })
            end
        end,
        dependencies = {
            'williamboman/mason.nvim',
            'hrsh7th/cmp-nvim-lsp',
            'nvim-telescope/telescope.nvim'
        }
    },
}
