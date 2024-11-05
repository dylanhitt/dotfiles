-- luacheck: push ignore vim
local v = vim
-- luacheck: pop

local mappings = {
    ["i"] = {
        { binding = '<C-e>', cmd = '<C-o>]}<C-o>A', opts = { noremap = true } },
        { binding = '<C-l>', cmd = '<C-o>A',        opts = { noremap = true } }
    },
    ["n"] = {
        {
            binding = 'gl',
            cmd = function()
                v.diagnostic.open_float()
            end,
            opts = { noremap = true }
        }
    }
}

for k, table in pairs(mappings) do
    for _, val in ipairs(table) do
        v.keymap.set(k, val.binding, val.cmd, val.opts)
    end
end
