" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Recently vim can merge signcolumn and number column into one
set signcolumn=number

" GoTo code navigation.
nmap <silent> <M-f> <Plug>(coc-implementation)
nmap <silent> <M-g> <Plug>(coc-definition)
nmap <silent> <F12> <M-g>
nmap <silent> <M-t> <Plug>(coc-type-definition)
nmap <silent> <M-S-f> <Plug>(coc-references)
nmap <silent> <M-S-r> <Plug>(coc-rename)
noremap <expr><M-S-e> ':CocDiagnostics<cr>'

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
