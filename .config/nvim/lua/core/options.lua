local autocmd = vim.api.nvim_create_autocmd
local opt = vim.opt

-------------------------------------- options ------------------------------------------
opt.title = true

opt.encoding = 'UTF-8'

opt.spelllang = 'en_us'
opt.spell = false

opt.backup = false
opt.writebackup = false
opt.compatible = false

opt.clipboard = 'unnamedplus'

--- appearance ---
opt.cursorline = true

opt.number = true
opt.relativenumber = true
opt.termguicolors = true

opt.list = true
opt.listchars = {
    eol = '$',
    tab = '| ',
    trail = '.',
    extends = '>',
    precedes = '.'
}

--- indentation ---
opt.autoindent = true
opt.smartindent = true

opt.smarttab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4

----------------------- file specfic settings ---------------------

--- golang ---
autocmd('Filetype', {
    pattern = { 'go', 'c' },
    command = 'setlocal nolist'
})

--- sh ---
autocmd('Filetype', {
    pattern = { 'sh', 'bash' },
    command = 'setlocal ts=4 sts=4 sw=4 noexpandtab'
})

autocmd('Filetype', {
    pattern = { 'sh', 'bash' },
    command = [[setlocal listchars=eol:$,trail:.,extends:>,precedes:.,tab:\ \ ]]
})

--- markup files ---
autocmd('Filetype', {
    pattern = { 'json', 'yml', 'yaml' },
    command = 'setlocal ts=2 sts=2 sw=2 expandtab'
})

--- lua ---
autocmd('Filetype', {
    pattern = { 'lua' },
    command = 'setlocal nolist ts=4 sts=4 sw=4 expandtab'
})
