return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { mode = "n", 'fg', "<cmd>Telescope live_grep<cr>",                 desc = "Live grep" },
            { mode = "n", 'ff', "<cmd>Telescope find_files<cr>",                desc = "Find file" },
            { mode = "n", 'fb', "<cmd>Telescope buffers<cr>",                   desc = "Current buffers" },
            { mode = "n", 'fc', "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Current buffer fuzzy finder" },
        },
        opts = function()
            local actions = require('telescope.actions')
            return {
                pickers = {
                    live_grep = {
                        mappings = {
                            i = { ["<c-f>"] = actions.to_fuzzy_refine },
                        },
                    },
                },
            }
        end
    }
}
