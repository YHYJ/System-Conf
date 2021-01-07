">>>EDIT & IDE<<<"
Plug 'terryma/vim-multiple-cursors'                           " 多行编辑
Plug 'luochen1990/rainbow'                                    " 彩虹括号，提高代码阅读质量
Plug 'Sirver/ultisnips'                                       " 自动预置代码片段，<插入>模式可用
Plug 'honza/vim-snippets'                                     " 代码片段引擎
Plug 'godlygeek/tabular'                                      " 文本对齐
Plug 'Chiel92/vim-autoformat'                                 " 使用已安装格式化程序自动格式化
Plug 'sheerun/vim-polyglot'                                   " 语法高亮大全
Plug 'editorconfig/editorconfig-vim'                          " 编码风格
Plug 'michaeljsmith/vim-indent-object'                        " 基于缩进操作代码
Plug 'simnalamburt/vim-mundo'                                 " vim历史撤销树
Plug 'aserebryakov/vim-todo-lists'                            " TODO list

">>>Code<<<"
Plug 'mileszs/ack.vim'                                        " 在项目中搜索指定代码（因为安装了ag而非ack，所以是Ag命令而不是Ack）
Plug 'easymotion/vim-easymotion'                              " 快捷跳转

">>>Python<<<"
Plug 'vim-scripts/indentpython.vim'                           " 自动缩进
Plug 'plytophogy/vim-virtualenv'                              " Python虚拟环境
Plug 'jeetsukumaran/vim-pythonsense'                          " 为Python类、方法、函数和doc字符串提供文本对象和动作

">>>Markdown<<<"
Plug 'plasticboy/vim-markdown'
Plug 'mzlogin/vim-markdown-toc'                               " Markdown目录生成器
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

">>>标点<<<"
Plug 'jiangmiao/auto-pairs'                                   " 成对操作，自动匹配前一个

">>>资源管理器<<<"
Plug 'liuchengxu/vista.vim'                                   " 搜索和查看LSP symbols和tags
Plug 'ctrlpvim/ctrlp.vim'                                     " 全路径模糊搜索
Plug 'danro/rename.vim'                                       " 文件重命名
Plug 'preservim/nerdtree'                                     " vim侧边文件管理器
Plug 'preservim/nerdcommenter'                                " 快捷键添加注释
Plug 'ryanoasis/vim-devicons'                                 " 在nerdtree显示文件icon
Plug 'Xuyuanp/nerdtree-git-plugin'                            " 在nerdtree显示git状态
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'                " 根据文件类型高亮文件名

">>>Vim中文help<<<"
Plug 'yianwillis/vimcdoc'                                     " vim中文文档

">>>阅读<<<"
Plug 'junegunn/limelight.vim'                                 " 阅读模式
Plug 'junegunn/goyo.vim'                                      " 内容定位

">>>Fun<<<"
Plug 'lilydjwg/colorizer'                                     " vim颜色码着色
Plug 'tyru/open-browser.vim'                                  " 打开URL

">>>Coc插件的附属LSP插件<<<"
" Plug 'neoclide/coc-python'                                    " Python LSP
