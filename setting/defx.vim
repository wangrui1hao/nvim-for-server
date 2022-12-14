call defx#custom#option('_', {
        \ 'winwidth': 30,
            \ 'split': 'vertical',
            \ 'direction': 'leftabove',
            \ 'show_ignored_files': 0,
            \ 'buffer_name': '',
            \ 'toggle': 1,
            \ 'resume': 1,
            \ 'columns': "git:mark:indent:icon:icons:filename"
            \ })

call defx#custom#column('filename', {
            \ 'directory_icon': '▸',
            \ 'opened_icon': '▾',
            \ 'root_icon': ' ',
            \ 'min_width': 5,
            \ 'max_width': 40,
            \ })

call defx#custom#column('mark', {
            \ 'selected_icon': '✓',
            \ 'readonly_icon': '✗',
            \ })

"call defx#custom#column('icon', {
"            \ 'readonly_icon': '✗',
"            \ 'selected_icon': '✓',
"            \ })

autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
    nnoremap <silent><buffer><expr> X       defx#do_action('execute_system')
    nnoremap <silent><buffer><expr> q       defx#do_action('quit')
    nnoremap <silent><buffer><expr> <Left>  defx#is_opened_tree() ? defx#do_action('close_tree') : defx#do_action('cd', ['..'])
    nnoremap <silent><buffer><expr> <Right> defx#do_action('call', 'DefxSmartL')
    nnoremap <silent><buffer><expr> <Cr>    defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('drop')
endfunction

" in this function we should vim-choosewin if possible
function! DefxSmartL(_)
    if defx#is_directory()
        call defx#call_action('open_or_close_tree')
        normal! j
    else
        let filepath = defx#get_candidate()['action__path']
        if tabpagewinnr(tabpagenr(), '$') >= 3    " if there are more than 2 normal windows
            if exists(':ChooseWin') == 2
                ChooseWin
            else
                if has('nvim')
                    let input = input({
                                \ 'prompt'      : 'ChooseWin No.: ',
                                \ 'cancelreturn': 0,
                                \ })
                    if input == 0 | return | endif
                else
                    let input = input('ChooseWin No.: ')
                endif
                if input == winnr() | return | endif
                exec input . 'wincmd w'
            endif
            exec 'e' filepath
        else
            exec 'wincmd w'
            exec 'e' filepath
        endif
    endif
endfunction

" defx git
let g:defx_git#indicators = {
    \ 'Modified'  : 'M',
    \ 'Staged'    : 'm',
    \ 'Untracked' : '?',
    \ 'Renamed'   : '>>',
    \ 'Unmerged'  : 'u',
    \ 'Ignored'   : 'i',
    \ 'Deleted'   : 'x',
    \ 'Unknown'   : '??'
    \ }

hi Defx_git_Untracked ctermfg=12 guifg=#81a2be
hi Defx_git_Ignored   ctermfg=8  guifg=#404660
hi Defx_git_Unknown   ctermfg=3  guifg=#f0c674
hi Defx_git_Renamed   ctermfg=3  guifg=#de935f
hi Defx_git_Modified  ctermfg=9  guifg=#cc6666
hi Defx_git_Unmerged  ctermfg=14 guifg=#8abeb7
hi Defx_git_Deleted   ctermfg=13 guifg=#b294bb
hi Defx_git_Staged    ctermfg=10 guifg=#b5bd68


" defx icons
"let g:defx_icons_enable_syntax_highlight = 1
"let g:defx_icons_column_length = 2
"let g:defx_icons_directory_icon = ''
"let g:defx_icons_mark_icon = '*'
"let g:defx_icons_parent_icon = ''
"let g:defx_icons_default_icon = ''
"let g:defx_icons_directory_symlink_icon = ''
"" Options below are applicable only when using "tree" feature
"let g:defx_icons_root_opened_tree_icon = ''
"let g:defx_icons_nested_opened_tree_icon = ''
"let g:defx_icons_nested_closed_tree_icon = ''


"-------------------------leaderf----------------------"
"" 设置LeaderF搜索匹配项的颜色
highlight Lf_hl_rgHighlight guifg=#FFFF00 guibg=NONE ctermfg=yellow ctermbg=NONE
highlight Lf_hl_match gui=bold guifg=Red cterm=bold ctermfg=21
highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201

"===================快捷按键定义==================
function Open_cur_file_dir()
	let g:cur_dir = expand("%:p:h")
	exec 'Defx '.g:cur_dir
endfunction

nnoremap <F2> <esc>:call Open_cur_file_dir()<cr>
