set number
set title

set autoindent
set smartindent

set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4

set mouse=a
set relativenumber
set ignorecase
set cursorline

set nobackup
set nowritebackup
set nocompatible
syntax on
filetype plugin indent on

set encoding=UTF-8

" Whitespace stuffs
set listchars=eol:$,tab:>.,trail:.,extends:>,precedes:.
set list

" MacOS copy and paste
set clipboard+=unnamedplus

call plug#begin()

Plug 'tpope/vim-surround' " Surrounding ysw)
Plug 'fatih/vim-go'
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'akinsho/toggleterm.nvim'
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'tpope/vim-fugitive'
Plug 'overcache/NeoSolarized'
Plug 'hzchirs/vim-material'
Plug 'tmsvg/pear-tree'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'wellle/context.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'stephpy/vim-yaml'
Plug 'brooth/far.vim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
Plug 'christianchiarulli/nvcode-color-schemes.vim'

set encoding=UTF-8

call plug#end()

source ~/.config/nvim/coc.vim

let g:neosolarized_contrast = "high"
let g:neosolarized_visibility = "high"

let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1

" Pear tree stuffs
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_map_special_keys = 0
imap <BS> <Plug>(PearTreeBackspace)
imap <CR> <Plug>(PearTreeExpand)

" colorscheme
if $COLORTERM =~# 'truecolor'
    set termguicolors
    colorscheme vim-material
else
    colorscheme nvcode
endif

lua <<EOF
require("toggleterm").setup{}

require("neo-tree").setup({
    window = {
        position = "right",
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
        }
    },
    event_handlers = {
        {
            event = "file_opened",
            handler = function(file_path)
                vim.cmd 'Neotree close'
           end
        }
    },
})
EOF

" Neotree mappings
nnoremap <C-y> :Neotree toggle<CR>

nmap <F8> :TagbarToggle<CR>

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Toggle terminal with C-q
nnoremap <silent> <C-q> :ToggleTerm<Enter>
tnoremap <silent> <C-q> <C-\><C-n>:ToggleTerm<Enter>

" Golang settings
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1
let g:go_list_type = 'quickfix'
let g:go_doc_keywordprg_enabled = 0
autocmd FileType go setlocal nolist

" Terraform settings
" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

" context.vim settings
let g:context_highlight_tag = '<hide>'
let g:context_highlight_border = '<hide>'

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab

autocmd FileType sh setlocal ts=4 sts=4 sw=4 noexpandtab
autocmd FileType sh setlocal listchars=tab:\ \ 

"""" Misc editor remappings
" Go to end of line while in insert mode
inoremap <C-l> <C-o>A
" Go to end of nested bracket and go to end of line 
inoremap <C-e> <C-o>]}<C-o>A

" Telescope hot key
nnoremap ff <cmd>Telescope find_files<cr>
nnoremap fg <cmd>Telescope live_grep<cr>
nnoremap fb <cmd>Telescope buffers<cr>
nnoremap fc <cmd>Telescope current_buffer_fuzzy_find<cr>

" Local Find and replace
function! Rnvar()
    let word_to_replace = expand("<cword>")
    let replacement = input("new name: ")
    execute '%s/\(\W\)' . word_to_replace . '\(\W\)/\1' . replacement . '\2/gc'
endfunction

" For local replace
nnoremap gr :call Rnvar()<CR>
