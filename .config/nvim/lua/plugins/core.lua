-- luacheck: push ignore vim
local v = vim
-- luacheck: pop
local g = v.g
local api = v.api

return {
    'nvim-tree/nvim-web-devicons',
    'tpope/vim-fugitive',
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
    },
    {
        'steelsojka/pears.nvim',
        config = function()
            require("pears").setup(function(conf)
                conf.remove_pair_on_outer_backspace(false)
            end)
        end
    },
    {
        'romainl/Apprentice',
        priority = 1000,
        lazy = false
    },
    {
        'akinsho/toggleterm.nvim',
        keys = {
            { mode = 'n', '<c-q>', ':ToggleTerm<Enter>' },
            { mode = 't', '<C-q>', [[<C-\><C-n>:ToggleTerm<Enter>]] }
        },
        init = function()
            require('toggleterm').setup({})
        end
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        cmd = 'Neotree',
        -- init neotree so it hijacks default netrw
        init = function()
            api.nvim_create_autocmd('BufEnter', {
                group = api.nvim_create_augroup('NeoTreeInit', { clear = true }),
                callback = function()
                    local f = v.fn.expand('%:p')
                    if v.fn.isdirectory(f) ~= 0 then
                        v.cmd('Neotree current dir=' .. f)
                        api.nvim_clear_autocmds { group = 'NeoTreeInit' }
                    end
                end
            })
        end,
        keys = {
            { mode = 'n', '<c-y>', ':Neotree toggle<cr>' }
        },
        opts = {
            window = {
                position = 'right',
            },
            filesystem = {
                filtered_items = {
                    hide_dotfiles = true,
                    hide_gitignored = true,
                },
                window = {
                    mappings = {
                        ["f"] = "",
                    },
                },
                hijack_netrw_behavior = "open_current"
            },
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function()
                        v.cmd 'Neotree close'
                    end
                }
            }
        }
    },
    {
        'LazyVim/LazyVim',
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
