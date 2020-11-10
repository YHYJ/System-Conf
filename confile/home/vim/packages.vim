"vim-pythonsense快捷键可能和pymode冲突"
"editorconfig-vim可能和自定义的冲突"

"========================= 正常的 ========================="
">>>EDIT & IDE<<<"
Plug 'terryma/vim-multiple-cursors'     " 多行编辑
Plug 'luochen1990/rainbow'              " 彩虹括号，提高代码阅读质量
Plug 'Sirver/ultisnips'                 " 自动预置代码片段，<插入>模式可用
Plug 'honza/vim-snippets'               " 代码片段引擎
Plug 'godlygeek/tabular'                " 文本对齐
Plug 'Yggdroot/indentLine'              " 显示对齐线
Plug 'scrooloose/nerdcommenter'         " 快捷键添加注释
Plug 'Chiel92/vim-autoformat'           " 使用已安装格式化程序自动格式化
Plug 'sheerun/vim-polyglot'             " 语法高亮大全
Plug 'editorconfig/editorconfig-vim'    " 编码风格
Plug 'michaeljsmith/vim-indent-object'  " 基于缩进操作代码
Plug 'simnalamburt/vim-mundo'           " vim历史撤销树
Plug 'aserebryakov/vim-todo-lists'      " TODO列表

">>>Code<<<"
Plug 'majutsushi/tagbar'                " 代码标签浏览器, 依赖ctags
Plug 'mileszs/ack.vim'                  " 在项目中搜索指定代码（因为安装了ag而非ack，所以是Ag命令而不是Ack）
Plug 'easymotion/vim-easymotion'        " 快捷跳转

">>>Python<<<"
Plug 'vim-scripts/indentpython.vim'     " 自动缩进
Plug 'plytophogy/vim-virtualenv'        " Python虚拟环境
Plug 'jeetsukumaran/vim-pythonsense'    " 为Python类、方法、函数和doc字符串提供文本对象和动作

">>>Markdown<<<"
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'         " Markdown目录生成器
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

">>>标点<<<"
Plug 'jiangmiao/auto-pairs'             " 成对操作，自动匹配前一个

">>>资源管理器<<<"
Plug 'ctrlpvim/ctrlp.vim'               " 全路径模糊搜索
Plug 'scrooloose/nerdtree'              " vim文管
Plug 'Xuyuanp/nerdtree-git-plugin'      " 在nerdtree显示git状态
Plug 'danro/rename.vim'                 " 文件重命名

">>>Vim中文help<<<"
Plug 'yianwillis/vimcdoc'

">>>阅读<<<"
Plug 'junegunn/limelight.vim'           " 阅读模式
Plug 'junegunn/goyo.vim'                " 内容定位

">>>Fun<<<"
Plug 'lilydjwg/colorizer'               " vim颜色码着色
Plug 'tyru/open-browser.vim'            " 打开URL


"========================= 暂时不使用的 ========================="
">>>Nim<<<"
" Plug 'zah/nim.vim'                      " 有BUG
" Plug 'baabelfish/nvim-nim'              " :make 命令检查代码错误，过时

">>>命令执行<<<"
" Plug 'tpope/vim-repeat'                 " 结合 . 重复执行一些插件的命令，支持有限

">>>EDIT & IDE<<<"
" Plug 'nathanaelkane/vim-indent-guides'  " 直观显示缩进级别
" Plug 'junegunn/vim-easy-align'          " 自动对齐：自定义对齐字符
" Plug 'vim-scripts/a.vim'                " 在源文件和头文件之间快速切换
" Plug 'matze/vim-move'                   " 文本移动, 无效

">>>Code<<<"
" Plug 'neomake/neomake'                  " 异步语法检查

">>>标点<<<"
" pelodelfuego/vim-swoop                  " 一次操作多文件

">>>Fun<<<"
" Plug 'kristijanhusak/vim-carbon-now-sh' " 将代码传到https://carbon.now.sh/生成代码图片
" Plug 'junegunn/vim-emoji'

">>>Rust<<<"
" Plug 'racer-rust/vim-racer'             " Racer的Vim支持
