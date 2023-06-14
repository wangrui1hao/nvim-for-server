" 打开当前文件的Blame信息
:function SvnBlameOpen()
  let has_svn = system('svn st -v ' . expand('%:p') . ' | wc -l')

  " 关闭上一个log窗口
  call CloseWindowByBufferName("svn_blame_file")
  
  if has_svn != 1
    return -1
  endif

  let line = line(".")
  setlocal nowrap
  " create a new window at the left-hand side
  aboveleft 18vnew
  " blame, ignoring white space changes
  %!svn blame -x-w "#"
  setlocal nomodified readonly buftype=nofile nowrap winwidth=1 nonumber
  file svn_blame_file
  if has('&relativenumber') | setlocal norelativenumber | endif
  " return to original line
  exec "normal " . line . "G"
  " synchronize scrolling, and return to original window
  setlocal scrollbind
  wincmd p
  setlocal scrollbind
  syncbind
:endfunction

" 打开当前文件的提交记录，或光标处ID的提交具体信息
:function SvnLogOpen()
  let svn_version = str2nr(substitute(expand("<cword>"), "^r", "", ""))
  let has_svn = system('svn st -v '.expand('%:p').' | wc -l')

  " 关闭上一个log窗口
  call CloseWindowByBufferName("svn_log_file")

  if svn_version == 0 && has_svn != 1
    return
  endif

  " 开一个新窗口
  botright 15new

  if svn_version != 0
    let string_script = '%!svn log -r ' . svn_version
  else
    let string_script = '%!svn log "#"'
  endif

  exec string_script
  normal gg
  setlocal nomodified readonly buftype=nofile nowrap
  file svn_log_file
  exec 'res 15'
:endfunction

:function CloseWindowByBufferName(bufferName)
  for i in range(1, winnr('$'))
    call win_execute(win_getid(i), 'if bufname() == a:bufferName | bd | endif')
  endfor
:endfunction

" 快捷键映射
nnoremap <expr><F9> ':call SvnBlameOpen()<cr>'
nnoremap <expr><F10> ':call SvnLogOpen()<cr>'
