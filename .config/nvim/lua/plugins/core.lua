local g = vim.g

return {
    'nvim-tree/nvim-web-devicons',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        'steelsojka/pears.nvim',
        config = function()
            require("pears").setup()
        end
    },
    {
        'EdenEast/nightfox.nvim',
        priority = 1000,
    },
    {
        'romainl/Apprentice',
        priority = 1000,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "apprentice",
        },
    },

    --- language specific ---
    {
        'fatih/vim-go',
        init = function()
            g.go_highlight_functions = 1
            g.go_highlight_function_calls = 1
            g.go_highlight_fields = 1
            g.go_highlight_extra_types = 1
            g.go_highlight_operators = 1
            g.go_fmt_autosave = 1
            g.go_fmt_command = "goimports"
            g.go_auto_type_info = 1
            g.go_metalinter_autosave = 1
            g.go_list_type = 'quickfix'
            g.go_doc_keywordprg_enabled = 0
        end
    }
}
