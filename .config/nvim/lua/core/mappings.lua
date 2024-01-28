local mappings = {
    ["i"] = {
        { binding = '<C-e>', cmd = '<C-o>]}<C-o>A', opts = { noremap = true } },
        { binding = '<C-l>', cmd = '<C-o>A',        opts = { noremap = true } }
    },
    ["n"] = {}
}


for k, table in pairs(mappings) do
    for _, v in ipairs(table) do
        vim.keymap.set(k, v.binding, v.cmd, v.opts)
    end
end
