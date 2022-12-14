"设置leader 按键 
let mapleader=','
let g:mapleader=','

"记住退出位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"开启语法高亮
syntax on
"NOTE: 以下配置有详细说明，一些特性不喜欢可以直接注解掉

"==========================================
" General Settings 基础设置
"==========================================

" history存储容量
set history=2000

" 检测文件类型
filetype on
"load plugin with diff file type 
filetype plugin on

" backspace 生效
set backspace=eol,start,indent

"ettings 文件编码,格式

" 设置新文件的编码为 UTF-8
set encoding=utf-8
" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn


" 自动换行缩进
set autoindent
" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
" set expandtab
" 设置编辑时制表符占用空格数
" set tabstop=4
" 设置格式化时制表符占用空格数
" set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4
" set noexpandtab

"行号  
set number
" 取消换行
set nowrap
" 括号配对情况, 跳转并高亮一下匹配的括号
set showmatch

"配色方案
set background=dark
set t_Co=256
colorscheme gruvbox

"------------------------------------------------------"
"" 设置vim搜索匹配项的颜色
hi Search cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
hi IncSearch cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE
hi QuickFixLine cterm=NONE ctermfg=yellow ctermbg=NONE gui=NONE guifg=#FFFF00 guibg=NONE

set cscopetag " 使用 cscope 作为 tags 命令
set cscopeprg='gtags-cscope' " 使用 gtags-cscope 代替 cscope

let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

let g:go_auto_type_info = 1
set updatetime=100
noremap <expr><M-S-r> ':GoRename<cr>'
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_rename_command = 'gopls'
set rtp+=$HOME/go/src/golang.org/x/lint/misc/vim
nnoremap <expr><M-S-l> ':execute "Lint" \| cw<cr>'
"autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

nnoremap <expr><M-S-s> ':Gtags -is .*'. expand("<cword>").'.*<Left><Left>'
nnoremap <expr><C-f> ':Gtags -ig .*'. expand("<cword>").'.*<Left><Left>'

noremap <C-M-Left> <C-o>    
noremap <C-M-Right> <C-i>    
noremap <M-c> :close<cr>    
noremap <C-Up> <C-w>k    
noremap <C-Down> <C-w>j    
noremap <C-Left> <C-w>h    
noremap <C-Right> <C-w>l
