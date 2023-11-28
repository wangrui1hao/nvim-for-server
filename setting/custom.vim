"SvnLog设置leader 按键 
let mapleader=','
let g:mapleader=','

"记住退出位置
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"开启语法高亮
syntax on
"扩大一下匹配内存
set mmp=10000

map <F4> :if exists("g:syntax_on") <Bar> syntax off <Bar> else <Bar> syntax enable <Bar> endif <CR>
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

" 设置新文件的编码为 UTF-8
set encoding=utf-8

" 自动判断编码时，依次尝试以下编码：
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set helplang=cn
set mouse=


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
let g:set_number=1
map <F3> :if (g:set_number==1) <Bar> let g:set_number=0 <Bar> set nonumber <Bar> else <Bar> let g:set_number=1 <Bar> set number <Bar> endif <CR>


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

let GtagsCscope_Auto_Load = 1
let CtagsCscope_Auto_Map = 1
let GtagsCscope_Quiet = 1

" Rainbow CSV相关
let g:disable_rainbow_key_mappings = 1
let g:rcsv_max_columns = 100
nnoremap <expr><F7> ':RainbowDelim<cr>'
nnoremap <expr><F8> ':NoRainbowDelim<cr>'

" vim-go 相关
let g:go_auto_type_info = 1
let g:go_jump_to_error = 0
set updatetime=100

nnoremap <expr><M-S-l> ':GoVet!<cr>'

nnoremap <expr><M-S-s> ':Gtags -is .*'. expand("<cword>").'.*<Left><Left>'
nnoremap <expr><C-f> ':Gtags -ig .*'. expand("<cword>").'.*<Left><Left>'

noremap <C-M-Left> <C-o>
noremap <C-M-Right> <C-i>
noremap <M-c> :bd<cr>
noremap <C-Up> <C-w>k
noremap <C-Down> <C-w>j
noremap <C-Left> <C-w>h
noremap <C-Right> <C-w>l

" 折叠相关
set foldmethod=syntax
set foldlevel=999
noremap <M-q> :if (&foldlevel==999) <Bar> set foldlevel=0 <Bar> else <Bar> set foldlevel=999 <Bar> endif <CR>
noremap <M-w> za
