nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <Esc> :call coc#float#close_all() <CR>
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"
inoremap <expr> <Esc> pumvisible() ? "<C-e>" : "<Esc>"

" Display completion
inoremap <silent><expr> <c-space> coc#refresh()

augroup cocgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

nnoremap <silent> Y :call ShowDocumentation()<CR>

function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
endfunction
