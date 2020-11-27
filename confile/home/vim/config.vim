"<<<<<<<<<<<<<<<<<<<<<<<<<< 0. vim和neovim有别的设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
if has('vim')
  set t_ti= t_te=                                                                 " 内容留屏
  set nocompatible                                                                " 不使用vi键盘模式
endif

if has('nvim')
  let g:python_host_prog='/home/yj/.virtualenvs/2/bin/python'                     " python2可执行文件路径
  let g:python3_host_prog='/home/yj/.virtualenvs/3/bin/python'                    " python3可执行文件路径
endif
"<<<<<<<<<<<<<<<<<<<<<<<<<< 0. vim和neovim有别的设置 end >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 1. 实用功能设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> 字体
set guifont=Monaco\ 14                                                          " gvim字体
">>>>>>>>>>>>>>>>>> 缓冲区
set hidden                                                                      " 缓冲区“隐藏”模式
">>>>>>>>>>>>>>>>>> 换行风格
set ff=unix                                                                     " 使用unix风格换行，ff=dos为dos风格
">>>>>>>>>>>>>>>>>> 编码和语言设置
set helplang=cn                                                                 " 帮助文件的优先语言版本，en是最后的
set encoding=UTF-8                                                              " 设置 Vim 内部使用的字符编码
">>>>>>>>>>>>>>>>>> history
set history=10000
">>>>>>>>>>>>>>>>>> 拼写检查
set spell spelllang=en_us
set spell spelllang=cjk
">>>>>>>>>>>>>>>>>> 搜索设置
set hlsearch                                                                    " 高亮所有匹配的搜索内容
set incsearch                                                                   " 搜索时动态显示匹配内容
set ignorecase                                                                  " 搜索大小写不敏感
set smartcase                                                                   " 搜索大写字符时使大小写敏感
">>>>>>>>>>>>>>>>>> 文件类型检查
filetype on                                                                     " 侦测文件类型
filetype plugin on                                                              " 载入文件类型插件
filetype indent on                                                              " 为特定类型文件载入相关缩进文件
">>>>>>>>>>>>>>>>>> 显示设置
set list                                                                        " 显示Tab符
" 制表符:|, 行尾空格:·, 右侧超出屏幕部分:>, 左侧超出屏幕部分:<
set listchars=tab:\|\ ,trail:·,extends:>,precedes:<                             " 对于特定的字符显示特定的虚拟代表字符
set fillchars=vert:\ ,stl:\ ,stlnc:\                                            " 在被分割的窗口间显示空白
set scrolloff=999                                                               " 上下可视行数
set sidescroll=1                                                                " 水平滚动的最小列数
set sidescrolloff=1                                                             " 光标两侧最小列数
set guicursor=                                                                  " 使光标模式保持一致
set scrolljump=0                                                                " 禁止自动显示多行
set cmdheight=1                                                                 " 命令行宽度
set cursorline                                                                  " 突出显示当前行
set cursorcolumn                                                                " 突出显示当前列
set showcmd                                                                     " 显示输入的命令
set showmatch                                                                   " 高亮显示匹配的括号
set showmode                                                                    " 显示当前模式
set matchtime=1                                                                 " 匹配括号高亮的时间（十分之一秒）
set display="lastline,msgsep"                                                   " 防止自动换行时看不见折叠行
">>>>>>>>>>>>>>>>>> 设置行长
set colorcolumn=81
">>>>>>>>>>>>>>>>>> 其他
set ttyfast                                                                     " 启用快速终端模式
set wildmenu                                                                    " 以增强模式运行命令行补全
set confirm                                                                     " 退出前对未保存和只读文件弹出确认
set gdefault                                                                    " 行内替换
set viminfo+=!                                                                  " 保存全局变量
set iskeyword+=_,$,@,%,#,-                                                      " 带有这些符号的单词不会被换行分割
set linespace=0                                                                 " 字符间插入的像素行数目
set report=0                                                                    " 使用: commands 命令，显示文件哪一行已修改
set magic                                                                       " 设置魔术
set title                                                                       " 改变终端标题
set nobackup                                                                    " 禁用备份
set noswapfile                                                                  " 禁用临时文件
set belloff=all                                                                 " 任何情况下禁止响铃和闪烁
set tm=500                                                                      " 为菜单或者工具定义提示，不适用于终端模式
set laststatus=2                                                                " 打开底部状态栏
set ruler                                                                       " 打开状态栏标尺
set go=                                                                         " 不要图形按钮
:command Q q                                                                    " 退出时不区分大小写
:command WQ wq                                                                  " 保存退出时不区分大小写
:command Wq wq                                                                  " 保存退出时不区分大小写
"<<<<<<<<<<<<<<<<<<<<<<<<<< 1. 实用功能设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 2. 泛代码设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> 代码折叠
" 折叠标识符列宽
set foldcolumn=3
" 折叠风格
set foldmethod=indent
" 所有折叠风格：indent  manual  expr  diff  syntax  marker
let g:SimpylFold_docstring_preview=1                                            " 显示文档字符串
">>>>>>>>>>>>>>>>>> 符号补全
inoremap ( ()<ESC>i
inoremap ) <C-r>=ClosePair(')')<CR>
inoremap { {}<ESC>i
inoremap } <C-r>=ClosePair('}')<CR>
inoremap [ []<ESC>i
inoremap ] <C-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i
function! ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
    return "\<Right>"
  else
    return a:char
  endif
endfunction
">>>>>>>>>>>>>>>>>> 一键执行
" % 代表要运行的源文件
" < 代表只取文件名，舍弃后缀
function! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!/usr/bin/time -p g++ % -o %<"
    exec "!/usr/bin/time -p ./%<"
  elseif &filetype == 'cpp'
    exec "!/usr/bin/time -p g++ % -o %<"
    exec "!/usr/bin/time -p ./%<"
  elseif &filetype == 'java'
    exec "!/usr/bin/time -p javac %"
    exec "!/usr/bin/time -p java %<"
  elseif &filetype == 'sh'
    exec "!/usr/bin/time -p bash %"
  elseif &filetype == 'python'
    exec "!/usr/bin/time -p /home/yj/.virtualenvs/3/bin/python %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'go'
    exec "!/usr/bin/time -p go run %"
  elseif &filetype == 'rust'
    exec "!/usr/bin/time -p cargo run %"
  elseif &filetype == 'nim'
    exec "!/usr/bin/time -p nim c -r %"
  elseif &filetype == 'lua'
    exec "!/usr/bin/time -p lua %"
  endif
endfunction
">>>>>>>>>>>>>>>>>> 文件类型识别
" autocmd BufRead,BufNew *.md,*.mkd,*.markdown,*.mkdn,*.mdwn,*.mdown set filetype=markdown.mkd
">>>>>>>>>>>>>>>>>> 缩进
set expandtab                                                                   " 缩进时用空格代替制表符
set tabstop=4                                                                   " Tab键的宽度
set shiftwidth=4                                                                " 移位操作 >> 或 << 的缩进长度
set softtabstop=4                                                               " 统一缩进为4
set smarttab                                                                    " 在行和段开始处使用制表符
set shiftround
set autoindent                                                                  " 新行自动保持上一行的缩进状态
set smartindent                                                                 " 智能缩进
set cindent
"<<<<<<<<<<<<<<<<<<<<<<<<<< 2. 泛代码设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 3. 各语言设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> Python | 新建.py文件预置内容
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai                 " 缩进
set completeopt=longest,menu                                                    " 代码补全
autocmd BufNewFile *.py exec ":call AutoSetPy()"
function! AutoSetPy()
  call setline(1, '#!/usr/bin/env python3')
  call append(1, '# -*- coding: utf-8 -*-')
  call append(2, '"""')
  call append(3, 'File: '.expand('%:t'))
  call append(4, 'Author: YJ')
  call append(5, 'Email: yj1516268@outlook.com')
  call append(6, 'Created Time: '.strftime('%Y-%m-%d %H:%M:%S'))
  call append(7, '')
  call append(8, 'Description:')
  call append(9, '"""')
  call append(10, '')
  call append(11, '')
  normal G
endfunction
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfunction
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
">>>>>>>>>>>>>>>>>> Nim
autocmd FileType nim set tabstop=2 shiftwidth=2 softtabstop=2 expandtab ai
">>>>>>>>>>>>>>>>>> Shell | 新建.sh文件预置内容
autocmd BufNewFile *.sh exec ":call AutoSetSh()"
function! AutoSetSh()
  call setline(1, '#!/usr/bin/env bash')
  call append(1, '')
  call append(2, ': <<!')
  call append(3, 'Name: '.expand('%:t'))
  call append(4, 'Author: YJ')
  call append(5, 'Email: yj1516268@outlook.com')
  call append(6, 'Created Time: '.strftime('%Y-%m-%d %H:%M:%S'))
  call append(7, '')
  call append(8, 'Description:')
  call append(9, '')
  call append(10, 'Attentions:')
  call append(11, '-')
  call append(12, '')
  call append(13, 'Depends:')
  call append(14, '-')
  call append(15, '!')
  call append(16, '')
  call append(17, '####################################################################')
  call append(18, '#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#')
  call append(19, '####################################################################')
  call append(20, '#------------------------- Program Variable')
  call append(21, '# program name')
  call append(22, 'readonly name=$(basename "$0")')
  call append(23, '# program version')
  call append(24, 'readonly major_version=0.1')
  call append(25, 'readonly minor_version='.strftime('%Y%m%d'))
  call append(26, 'readonly rel_version=1')
  call append(27, '')
  call append(28, '#------------------------- Exit Code Variable')
  call append(29, 'readonly normal=0           # 一切正常')
  call append(30, 'readonly err_file=1         # 文件/路径类错误')
  call append(31, 'readonly err_param=2        # 参数错误')
  call append(32, 'readonly err_fetch=48       # checkupdate错误')
  call append(33, 'readonly err_permission=110 # 权限错误')
  call append(34, 'readonly err_range=122      # 取值范围错误')
  call append(35, 'readonly err_ctrl_c=130     # 接收到INT(Ctrl+C)指令')
  call append(36, 'readonly err_unknown=255    # 未知错误')
  call append(37, 'readonly err_no_program=127 # 未找到命令')
  call append(38, '')
  call append(39, '#------------------------- Parameter Variable')
  call append(40, '# description variable')
  call append(41, 'readonly desc="TODO"')
  call append(42, '')
  call append(43, '####################################################################')
  call append(44, '#+++++++++++++++++++++++++ Define Function ++++++++++++++++++++++++#')
  call append(45, '####################################################################')
  call append(46, '#------------------------- Info Function')
  call append(47, 'function helpInfo() {')
  call append(48, '  echo -e ""')
  call append(49, '  echo -e "\e[32m$name\e[0m\e[1m$desc\e[0m"')
  call append(50, '  echo -e "--------------------------------------------------"')
  call append(51, '  echo -e "Usage:"')
  call append(52, '  echo -e ""')
  call append(53, '  echo -e "     $name [OPTION]"')
  call append(54, '  echo -e ""')
  call append(55, '  echo -e "Options:"')
  call append(56, '  echo -e ""')
  call append(57, '  echo -e "     -h, --help        显示帮助信息"')
  call append(58, '  echo -e "     -v, --version     显示版本信息"')
  call append(59, '}')
  call append(60, '')
  call append(61, 'function versionInfo() {')
  call append(62, '  echo -e "\e[1m$name\e[0m version (\e[1m$major_version-$minor_version.$rel_version\e[0m)"')
  call append(63, '}')
  call append(64, '#------------------------- Feature Function')
  call append(65, '')
  call append(66, '####################################################################')
  call append(67, '#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#')
  call append(68, '####################################################################')
  call append(69, '')
  normal 8j
endfunction
">>>>>>>>>>>>>>>>>> docker-compose | 新建compose file预置内容
autocmd BufNewFile *docker-compose*.y*ml exec ":call AutoSetDockerCompose()"
function! AutoSetDockerCompose()
  call setline(1, '# File: '.expand('%:t'))
  call append(1, '# Author: YJ')
  call append(2, '# Email: yj1516268@outlook.com')
  call append(3, '# Created Time: '.strftime('%Y-%m-%d %H:%M:%S'))
  call append(4, '')
  call append(5, '# Description:')
  call append(6, '')
  call append(7, "version: '3'")
  call append(8, 'services:')
  call append(9, '  '.expand('%:p:h:t').':')
  call append(10, "    image: '".expand('%:p:h:t')."'")
  call append(11, "    container_name: '".expand('%:p:h:t')."'")
  call append(12, "    hostname: '".expand('%:p:h:t')."-docker'")
  call append(13, "    restart: 'unless-stopped'  # no, unless-stopped, always, on-failure:<max-retries>")
  call append(14, '    privileged: false')
  call append(15, '    ports:')
  call append(16, "      - ':'")
  call append(17, '    volumes:')
  call append(18, "      - ':'")
  call append(19, '    networks:')
  call append(20, '      '.expand('%:p:h:t').': {}')
  call append(21, '    environment:')
  call append(22, "      TZ: 'Asia/Shanghai'")
  call append(23, '    labels:')
  call append(24, "      servicename: '".expand('%:p:h:t')."'")
  call append(25, '    logging:')
  call append(26, "      driver: 'json-file'      # none, local, json-file(default), ...")
  call append(27, '      options:')
  call append(28, "        max-size: '10m'")
  call append(29, "        max-file: '3'")
  call append(30, "        tag: '{{.Name}}/{{.ID}}/{{.ImageName}}/{{.ImageID}}'")
  call append(31, "        labels: 'servicename'")
  call append(32, '')
  call append(33, '')
  call append(34, 'volumes:')
  call append(35, '  '.expand('%:p:h:t').':')
  call append(36, "    name: '".expand('%:p:h:t')."'")
  call append(37, '')
  call append(38, '')
  call append(39, 'networks:')
  call append(40, '  '.expand('%:p:h:t').':')
  call append(41, "    name: '".expand('%:p:h:t')."'")
  normal 5j
endfunction
">>>>>>>>>>>>>>>>>> golang | 新建.go文件预置内容
autocmd BufNewFile *.go exec ":call AutoSetGolang()"
function! AutoSetGolang()
  call setline(1, '/* File: '.expand('%:t').' */')
  call append(1, '/* Auther: YJ */')
  call append(2, '/* Email: yj1516268@outlook.com */')
  call append(3, '/* Created Time: '.strftime('%Y-%m-%d %H:%M:%S').' */')
  call append(4, '')
  call append(5, '// Description:')
  call append(6, '')
  call append(7, 'package '.expand('%:p:h:t'))
  call append(8, '')
  call append(9, 'import (')
  call append(10, '	"fmt"')
  call append(11, ')')
  call append(12, '')
  call append(13, '')
  normal G
endfunction
">>>>>>>>>>>>>>>>>> markdown | 新建.md文件预置内容
autocmd BufNewFile *.md exec ":call AutoSetMarkdown()"
function! AutoSetMarkdown()
  call setline(1, '# '.expand('%:t:r'))
  call append(1, '')
  call append(2, "<!-- Document info -->")
  call append(3, '')
  call append(4, '---')
  call append(5, '')
  call append(6, '## Table of Contents')
  call append(7, '')
  call append(8, "<!-- vim-markdown-toc GFM -->")
  call append(9, '')
  call append(10, "<!-- vim-markdown-toc -->")
  call append(11, '')
  call append(12, '---')
  call append(13, '')
  call append(14, "<!-- Object info -->")
  call append(15, '')
  call append(16, '---')
  call append(17, '')
  call append(18, '')
endfunction
"<<<<<<<<<<<<<<<<<<<<<<<<<< 3. 各语言设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 4. 开关和快捷键设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> vim原生快捷键
" J -- 将下一行提到当前行后面
">>>>>>>>>>>>>>>>>> Set Leader
let maplocalleader = ","
let mapleader = "."
">>>>>>>>>>>>>>>>>> .sa | 全选
map <Leader>sa ggVG"
">>>>>>>>>>>>>>>>>> yapf/isort: 代码整理
" 代码格式化
autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
" import整理
autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
"++++++++++++++++++++
" F2 - 文件浏览器
" F3 - 代码标签浏览器
" F4 - 历史撤销树浏览器
" F5 - 专注+打字机模式
" F6 - 语法高亮开关
" F7 - 自动换行开关/粘贴模式
" F8 - 显示可打印字符开关
" F9 - Autoformat格式化
" F10 - Ale格式化
" F12 - 执行代码
"++++++++++++++++++++
">>>>>>>>>>>>>>>>>> nerdtree: 文件浏览器
noremap <F2> :NERDTreeToggle<CR>
">>>>>>>>>>>>>>>>>> <F3> | tagbar: 代码标签浏览器
nnoremap <F3> :TagbarToggle<CR>
">>>>>>>>>>>>>>>>>> <F4> | vim-mundo: 历史撤销树浏览器
nnoremap <F4> :MundoToggle<CR>
">>>>>>>>>>>>>>>>>> <F5> | goyo.vim+limelight.vim: 专注+打字机模式
nnoremap <F5> :call Goyo_Limelight()<CR>
function! Goyo_Limelight()
  exec 'Goyo'
  exec 'Limelight!!'
endfunction
">>>>>>>>>>>>>>>>>> <F6> | 语法高亮开关
nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
">>>>>>>>>>>>>>>>>> <F7> | 自动换行开关
nnoremap <F7> :set nowrap! wrap?<CR>
">>>>>>>>>>>>>>>>>> <F7> | 在 INSERT 模式下进入粘贴模式
set pastetoggle=<F7>
au InsertLeave * set nopaste
">>>>>>>>>>>>>>>>>> <F8> | 显示可打印字符开关
nnoremap <F8> :set list! list?<CR>
">>>>>>>>>>>>>>>>>> <F9> | Autoformat: 代码格式化
noremap <F9> :Autoformat<CR>
">>>>>>>>>>>>>>>>>> <F10> | ale: 代码格式化
noremap <F10> :ALEFix<CR>
">>>>>>>>>>>>>>>>>> <F12> | 执行代码
nnoremap <F12> :call CompileRunGcc()<CR>
"<<<<<<<<<<<<<<<<<<<<<<<<<< 4. 开关和快捷键设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 5. 文件操作设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
set autoread                                                                    " 自动重载
set autowrite                                                                   " 自动保存
set autochdir                                                                   " 自动切换工作目录
set clipboard+=unnamed                                                          " 共享剪切板
" set undofile                                                                    " 允许撤销上次打开文件所做的更改
"<<<<<<<<<<<<<<<<<<<<<<<<<< 5. 文件操作设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 6. Vim风格设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> Theme
colorscheme space-vim-dark
" 启用true colors
set termguicolors
">>>>>>>>>>>>>>>>>> 背景色，默认235
" 233(最暗) ~ 238(最亮)
color space-vim-dark
let g:space_vim_dark_background = 235
">>>>>>>>>>>>>>>>>> 高亮
" 注释 - 斜体灰色
highlight Comment cterm=italic ctermfg=59 guifg=#5C6370
" 行号列 - 无（即与主页面相同）
highlight LineNr ctermbg=NONE guibg=NONE
"<<<<<<<<<<<<<<<<<<<<<<<<<< 6. Vim风格设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 7. 插件设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> choosewin: 切换工作区
nmap - <Plug>(choosewin)
">>>>>>>>>>>>>>>>>> ctrlp: 全路径文件模糊搜索
let g:ctrlp_map = "<C-f>"
">>>>>>>>>>>>>>>>>> nerdtree: 文件管理器
let g:netrw_winsize = 30                                                        " 文件管理器宽度设置
">>>>>>>>>>>>>>>>>> open-browser.vim: 使用默认浏览器打开链接
nmap <C-o> <Plug>(openbrowser-smart-search)
vmap <C-o> <Plug>(openbrowser-smart-search)
">>>>>>>>>>>>>>>>>> vim-airline: Vim状态栏
let g:airline#extensions#virtualenv#enabled = 1                                 " 在airline上显示vim-virtualenv环境
">>>>>>>>>>>>>>>>>> vim-virtualenv: 将Python Virtualenv环境集成到Vim
let g:virtualenv_directory = '/home/yj/.virtualenvs'
">>>>>>>>>>>>>>>>>> vim-multiple-cursors: 多行编辑
let g:multi_cursor_next_key = '<C-n>'                                           " 下一匹配字符串
let g:multi_cursor_prev_key = '<C-p>'                                           " 上一匹配字符串
let g:multi_cursor_skip_key = '<C-x>'                                           " 跳过下一匹配字符串
let g:multi_cursor_quit_key = '<Esc>'                                           " 退出多行编辑模式
" 设置高亮 (see help :highlight and help :highlight-link)
highlight multiple_cursors_cursor term=reverse cterm=reverse gui=reverse
highlight link multiple_cursors_visual Visual
">>>>>>>>>>>>>>>>>> ale: 语法检查
if g:spacevim.vim8 || g:spacevim.nvim
  " ale {
  let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'python': ['yapf', 'isort'],
        \   'sh': ['shfmt'],
        \   'javascript': ['eslint'],
        \}
  let g:ale_set_highlights = 1
  let g:ale_fix_on_save = 0
  let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
  let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']

  let g:ale_sign_error = '>>'
  let g:ale_sign_warning = '--'
  let g:ale_echo_msg_error_str = g:spacevim.gui ? 'Error' : '✹ Error'
  let g:ale_echo_msg_warning_str = g:spacevim.gui ? 'Warning' : '⚠ Warning'

  let g:ale_completion_delay = 500
  let g:ale_echo_delay = 20
  let g:ale_lint_delay = 500
  let g:ale_lint_on_text_changed = 'normal'
  let g:ale_lint_on_insert_leave = 1

  nmap <Leader>en <Plug>(ale_next)
  nmap <Leader>ep <Plug>(ale_previous)
  nnoremap <Leader>ts :ALEToggle<CR>
  " }
else
  " syntastic {
  let g:syntastic_python_checkers=['pyflakes']
  let g:syntastic_javascript_checkers=['jsl', 'jshint']
  let g:syntastic_html_checkers=['tidy', 'jshint']
  let g:syntastic_error_symbol='✹'
  let g:syntastic_warning_symbol='✴'
  let g:syntastic_aggregate_errors=1

  nnoremap <Leader>ts :SyntasticToggleMode<CR>
  " }
endif
">>>>>>>>>>>>>>>>>> rainbow: 彩虹括号
let g:rainbow_active = 1
let g:rainbow_conf = {
      \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
      \ 'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
      \ 'operators': '_,_',
      \ 'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
      \ 'separately': {
      \ '*': {},
      \ 'tex': {
      \ 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/']
      \ },
      \ 'lisp': {
      \ 'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3']
      \ },
      \ 'vim': {
      \ 'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
      \ },
      \ 'html': {
      \ 'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
      \ },
      \ 'css': 0,
      \ }
      \ }
">>>>>>>>>>>>>>>>>> nerdcommenter: 注释
let g:NERDSpaceDelims = 1                                                       " 是否在注释符后添加空格
let g:NERDCompactSexyComs = 1                                                   " 紧凑语法修饰多行注释
let g:NERDDefaultAlign = 'left'                                                 " 注释符依据左对齐而非上方的代码缩进
let g:NERDAltDelims_java = 1                                                    " 默认使用备用分隔符
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }           " 自定义注释格式
let g:NERDCommentEmptyLines = 1                                                 " 允许注释和反转空行
let g:NERDTrimTrailingWhitespace = 1                                            " 取消注释时启用行尾空格整理
let g:NERDToggleCheckAllLines = 1                                               " 启用 NERDCommenterToggle 来检查是否以注释/取消注释所有选定的行
">>>>>>>>>>>>>>>>>> ultisnips: 代码模板
let g:UltiSnipsExpandTrigger = "<LocalLeader><Leader>"                          " 插入代码块的快捷键(,.)
let g:UltiSnipsJumpForwardTrigger = "<C-f>"                                     " 跳转到下一个Trigger
let g:UltiSnipsJumpBackwardTrigger = "<C-b>"                                    " 跳转到上一个Trigger
let g:UltiSnipsEditSplit = "vertical"
">>>>>>>>>>>>>>>>>> syntastic: 代码检查
" let g:syntastic_error_symbol = "✹"
" let g:syntastic_warning_symbol = "✴"
">>>>>>>>>>>>>>>>>> YCMD: 代码补全
" YCM的快捷键设置在 ~/.space-vim/core/autoload/spacevim/autocmd/youcompleteme.vim "
set completeopt=menu,menuone                                                    " 让补全行为与一般的IDE一致
" set completeopt-=preview                                                        " 在接受补全后不分裂出一个窗口显示接受的项
" let g:ycm_cache_omnifunc=0                                                      " 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_show_diagnostics_ui = 0                                               " 禁止YCM显示诊断信息
let g:ycm_min_num_of_chars_for_completion = 1                                   " 输入第1个字符就开始补全
let g:ycm_key_invoke_completion = '<C-z>'                                       " 手动语义补全快捷键
" 自动语义补全触发: 输入两个字符即触发
let g:ycm_semantic_triggers = {
      \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
      \ 'cs,lua,javascript': ['re!\w{2}'],
      \ }
" 白名单，只有文件类型如下时YCM生效
let g:ycm_filetype_whitelist = {
      \ "c":1, "cpp":1, "objc":1,
      \ "go":1,
      \ "java":1,
      \ "nim":1,
      \ "python":1,
      \ "rust":1,
      \ "sh":1, "zsh":1,
      \ "zimbu":1,
      \ }
autocmd FileType c,cpp,python,rust,javascript,typescript
      \ nnoremap <LocalLeader>gd :YcmCompleter GetDoc<CR>
autocmd FileType c,cpp,python,go,javascript,rust
      \ nnoremap <LocalLeader>gD :YcmCompleter GoTo<CR>
autocmd FileType javascript,python,typescript
      \ nnoremap <LocalLeader>gr :YcmCompleter GoToReferences<CR>
autocmd FileType c,cpp,javascript,typescript
      \ nnoremap <LocalLeader>gt :YcmCompleter GetType<CR>
autocmd FileType c,cpp
      \ nnoremap <LocalLeader>gi :YcmCompleter GoToInclude<CR>
autocmd FileType c,cpp
      \ nnoremap <LocalLeader>gp :YcmCompleter GetParent<CR>
">>>>>>>>>>>>>>>>>> vim-go: golang多功能插件
let g:go_fmt_autosave = 0                                                       " 禁用vim-go的自动格式化
let g:go_autodetect_gopath = 1                                                  " 自动发现GOPATH变量，禁用则package自动补全失效
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
">>>>>>>>>>>>>>>>>> topbar: 标签查看器
let g:tagbar_type_go = {
      \ 'ctagstype': 'go',
      \ 'kinds': [
      \ 'p:package',
      \ 'i:imports:1',
      \ 'c:constants',
      \ 'v:variables',
      \ 't:types',
      \ 'n:interfaces',
      \ 'w:fields',
      \ 'e:embedded',
      \ 'm:methods',
      \ 'r:constructor',
      \ 'f:functions'
      \ ],
      \ 'sro': '.',
      \ 'kind2scope': {
      \ 't': 'ctype',
      \ 'n': 'ntype'
      \ },
      \ 'scope2kind': {
      \ 'ctype': 't',
      \ 'ntype': 'n'
      \ },
      \ 'ctagsbin': 'gotags',
      \ 'ctagsargs': '-sort -silent'
      \ }
">>>>>>>>>>>>>>>>>> vim-markdown: markdown插件
let g:vim_markdown_toc_autofit = 1                                              " 自适应目录窗口大小
let g:vim_markdown_conceal_code_blocks = 0                                      " 禁用隐藏代码块标记
let g:vim_markdown_toml_frontmatter = 1                                         " 突出显示hugo的toml格式文件
let g:vim_markdown_strikethrough = 1                                            " 设置使用`~~XX~~`作为删除线语法
let g:vim_markdown_auto_insert_bullets = 0                                      " 禁止自动插入语法
let g:vim_markdown_new_list_item_indent = 0                                     " 禁止自动缩进
" let g:vim_markdown_frontmatter = 1                                              " 突出显示hugo的yaml格式文件
" let g:vim_markdown_json_frontmatter = 1                                         " 突出显示hugo的json格式文件
" set conceallevel=2                                                              " 1.启用语法标准隐藏
let g:vim_markdown_conceal = 0                                                  " 2.完全禁用语法隐藏
" let g:tex_conceal = ''                                                          " 3.在启用LaTeX语法的情况下禁用数学隐藏
" let g:vim_markdown_math = 1                                                     " 3.在启用LaTeX语法的情况下禁用数学隐藏
">>>>>>>>>>>>>>>>>> tabular: 自动对齐
" 当在markdown文件中输入了 |<TAB>| 时自动对齐表格
inoremap <silent> <Bar> <Bar><Esc>:call <SID>table_auto_align()<CR>a
function! s:table_auto_align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction
">>>>>>>>>>>>>>>>>> markdown-preview.nvim: Markdown和UML文件预览（使用浏览器）
let g:mkdp_auto_start = 0                                                       " 是否在进入markdown缓冲区后自动打开预览窗口
let g:mkdp_auto_close = 1                                                       " 当markdown缓冲区关闭后是否自动关闭预览窗口
let g:mkdp_refresh_slow = 0                                                     " 0 = 实时自动刷新预览窗口；1 = 只有保存缓冲区或者退出插入模式时才刷新预览窗口
let g:mkdp_command_for_global = 1                                               " 设置`MarkdownPreview`命令是否在所有文件都有效，0 = 只在md文件有效
let g:mkdp_open_to_the_world = 0                                                " 设置预览窗口是侦听localhost还是0.0.0.0，0 = localhost
let g:mkdp_open_ip = ''                                                         " 远程预览窗口的IP
let g:mkdp_browser = ''                                                         " 指定打开预览窗口的浏览器
let g:mkdp_echo_preview_url = 0                                                 " 设置是否回显预览窗口地址
let g:mkdp_browserfunc = ''                                                     " 自定义用来打开预览窗口的函数，URL是参数
let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'middle',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {}
      \ }
let g:mkdp_markdown_css = ''                                                    " 自定义Markdown样式，必须是绝对路径
let g:mkdp_highlight_css = ''                                                   " 自定义高亮样式，必须是绝对路径
let g:mkdp_port = ''                                                            " 自定义预览窗口的端口，为空则随机
let g:mkdp_page_title = '「${name}」'                                           " 预览窗口的标题，'「${name}」'是文件名
">>>>>>>>>>>>>>>>>> vim-todo-lists: 简单的自动维护TODO列表
let g:VimTodoListsDatesEnabled = 1                                              " 自动插入日期
let g:VimTodoListsDatesFormat = "%Y-%m-%d %H:%M"                                " 日期格式(Year-Month-Day Hour:Minute)
">>>>>>>>>>>>>>>>>> python-mode: python IDE
" [[    跳转到上一个class或function (normal, visual, operator modes)
" ]]    跳转到下一个class或function (normal, visual, operator modes)
" [M    跳转到上一个class或method (normal, visual, operator modes)
" ]M    跳转到下一个class或method (normal, visual, operator modes)
" aC    操作class，比如: daC, yaC, vaC, caC (normal, operator modes)
" iC    操作class内容，比如: diC, yiC, viC, ciC (normal, operator modes)
" aM    操作function或method. Ex: daM, yaM, vaM, caM (normal, operator modes)
" iM    操作function或method内容. Ex: diM, yiM, viM, ciM (normal, operator modes)
" let g:pymode_breakpoint_bind = '<LocalLeader>b'                                 " 添加断点
" let g:pymode_lint_on_fly = 1                                                    " 启用写入时语法检测
" let g:pymode_lint_on_write = 1                                                  " 启用保存时语法检测
" let g:pymode_lint_checkers = ['pyflakes', 'pep8']                               " 语法检测标准
" let g:pymode_doc = 0                                                            " 禁用pymode-doc功能，使用YCM-doc
"<<<<<<<<<<<<<<<<<<<<<<<<<< 7. 插件设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"



"<<<<<<<<<<<<<<<<<<<<<<<<<< 8. Other设置 Start >>>>>>>>>>>>>>>>>>>>>>>>>>"
">>>>>>>>>>>>>>>>>> TODO\FIXME\CHANGED\BUG\HACK\NOTE\INFO\IDEA\DEBUG\WARNING\ERROR\CRITICAL的高亮
autocmd Syntax * call matchadd('Todo', '\W\zs\(TODO\|FIXME\|CHANGED\|BUG\|HACK\)')
autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\|DEBUG\|WARNING\)')
autocmd Syntax * call matchadd('Error', '\W\zs\(ERROR\|CRITICAL\)')
"<<<<<<<<<<<<<<<<<<<<<<<<<< 8. Other设置 End >>>>>>>>>>>>>>>>>>>>>>>>>>"
