# README

[space-vim](https://github.com/liuchengxu/space-vim)中各部分的作用

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [layer](#layer)
    * [+checkers](#checkers)
        * [syntax-checking](#syntax-checking)
            * [身份](#身份)
            * [成员](#成员)
            * [依赖](#依赖)
    * [+completion](#completion)
        * [asyncomplete](#asyncomplete)
            * [身份](#身份-1)
            * [成员](#成员-1)
            * [依赖](#依赖-1)
        * [auto-completion](#auto-completion)
            * [身份](#身份-2)
            * [成员](#成员-2)
            * [依赖](#依赖-2)
        * [deoplete](#deoplete)
            * [身份](#身份-3)
            * [成员](#成员-3)
            * [依赖](#依赖-3)
        * [unite](#unite)
            * [身份](#身份-4)
            * [成员](#成员-4)
            * [依赖](#依赖-4)
            * [快捷键](#快捷键)
    * [+distributions](#distributions)
        * [better-defaults](#better-defaults)
            * [身份](#身份-5)
            * [成员](#成员-5)
            * [依赖](#依赖-5)
            * [快捷键](#快捷键-1)
        * [spacevim](#spacevim)
            * [身份：](#身份-6)
            * [成员：](#成员-6)
            * [依赖：](#依赖-6)
    * [+fun](#fun)
        * [emoji](#emoji)
            * [身份：](#身份-7)
            * [成员：](#成员-7)
            * [依赖：](#依赖-7)
        * [games](#games)
            * [身份：](#身份-8)
            * [成员：](#成员-8)
            * [依赖：](#依赖-8)
        * [goyo](#goyo)
            * [身份：](#身份-9)
            * [成员：](#成员-9)
            * [依赖：](#依赖-9)
    * [+lang](#lang)
        * [c-c++](#c-c)
            * [身份：](#身份-10)
            * [成员：](#成员-10)
            * [依赖：](#依赖-10)
        * [clojure](#clojure)
            * [身份：](#身份-11)
            * [成员：](#成员-11)
            * [依赖：](#依赖-11)
        * [elixir](#elixir)
            * [身份：](#身份-12)
            * [成员：](#成员-12)
            * [依赖：](#依赖-12)
        * [elm](#elm)
            * [身份：](#身份-13)
            * [成员：](#成员-13)
            * [依赖：](#依赖-13)
        * [erlang](#erlang)
            * [身份：](#身份-14)
            * [成员：](#成员-14)
            * [依赖：](#依赖-14)
        * [go](#go)
            * [身份：](#身份-15)
            * [成员：](#成员-15)
            * [依赖：](#依赖-15)
        * [graphviz](#graphviz)
            * [身份：](#身份-16)
            * [成员：](#成员-16)
            * [依赖：](#依赖-16)
        * [haskell](#haskell)
            * [身份：](#身份-17)
            * [成员：](#成员-17)
            * [依赖：](#依赖-17)
        * [html](#html)
            * [身份：](#身份-18)
            * [成员：](#成员-18)
            * [依赖：](#依赖-18)
        * [java](#java)
            * [身份：](#身份-19)
            * [成员：](#成员-19)
            * [依赖：](#依赖-19)
        * [javascript](#javascript)
            * [身份：](#身份-20)
            * [成员：](#成员-20)
            * [依赖：](#依赖-20)
        * [latex](#latex)
            * [身份：](#身份-21)
            * [成员：](#成员-21)
            * [依赖：](#依赖-21)
        * [markdown](#markdown)
            * [身份：](#身份-22)
            * [成员：](#成员-22)
            * [依赖：](#依赖-22)
        * [python](#python)
            * [身份：](#身份-23)
            * [成员：](#成员-23)
            * [依赖：](#依赖-23)
        * [ruby](#ruby)
            * [身份：](#身份-24)
            * [成员：](#成员-24)
            * [依赖：](#依赖-24)
        * [rust](#rust)
            * [身份：](#身份-25)
            * [成员：](#成员-25)
            * [依赖：](#依赖-25)
        * [scala](#scala)
            * [身份：](#身份-26)
            * [成员：](#成员-26)
            * [依赖：](#依赖-26)
        * [solidity](#solidity)
            * [身份：](#身份-27)
            * [成员：](#成员-27)
            * [依赖：](#依赖-27)
        * [typescript](#typescript)
            * [身份：](#身份-28)
            * [成员：](#成员-28)
            * [依赖：](#依赖-28)
        * [vue](#vue)
            * [身份：](#身份-29)
            * [成员：](#成员-29)
            * [依赖：](#依赖-29)
        * [wasm](#wasm)
            * [身份：](#身份-30)
            * [成员：](#成员-30)
            * [依赖：](#依赖-30)
    * [+misc](#misc)
        * [chinese](#chinese)
            * [身份：](#身份-31)
            * [成员：](#成员-31)
            * [依赖：](#依赖-31)
    * [+programming](#programming)
        * [code-snippets](#code-snippets)
            * [身份：](#身份-32)
            * [成员：](#成员-32)
            * [依赖：](#依赖-32)
        * [editing](#editing)
            * [身份：](#身份-33)
            * [成员：](#成员-33)
            * [依赖：](#依赖-33)
        * [formatting](#formatting)
            * [身份：](#身份-34)
            * [成员：](#成员-34)
            * [依赖：](#依赖-34)
        * [programming](#programming-1)
            * [身份：](#身份-35)
            * [成员：](#成员-35)
            * [依赖：](#依赖-35)
    * [+themes](#themes)
        * [airline](#airline)
            * [身份：](#身份-36)
            * [成员：](#成员-36)
            * [依赖：](#依赖-36)
        * [lightline](#lightline)
            * [身份：](#身份-37)
            * [成员：](#成员-37)
            * [依赖：](#依赖-37)
    * [+tools](#tools)
        * [cscope](#cscope)
            * [身份：](#身份-38)
            * [成员：](#成员-38)
            * [依赖：](#依赖-38)
        * [ctags](#ctags)
            * [身份：](#身份-39)
            * [成员：](#成员-39)
            * [依赖：](#依赖-39)
        * [docker](#docker)
            * [身份：](#身份-40)
            * [成员：](#成员-40)
            * [依赖：](#依赖-40)
        * [file-manager](#file-manager)
            * [身份：](#身份-41)
            * [成员：](#成员-41)
            * [依赖：](#依赖-41)
        * [fzf](#fzf)
            * [身份：](#身份-42)
            * [成员：](#成员-42)
            * [依赖：](#依赖-42)
        * [lsp](#lsp)
            * [身份：](#身份-43)
            * [成员：](#成员-43)
            * [依赖：](#依赖-43)
        * [tmux](#tmux)
            * [身份：](#身份-44)
            * [成员：](#成员-44)
            * [依赖：](#依赖-44)
        * [ycmd](#ycmd)
            * [身份：更强大的自动补全layer](#身份更强大的自动补全layer)
            * [成员：](#成员-45)
            * [依赖：](#依赖-45)
    * [+version-control](#version-control)
        * [git](#git)
            * [身份：](#身份-45)
            * [成员：](#成员-46)
            * [依赖：](#依赖-46)
        * [github](#github)
            * [身份：](#身份-46)
            * [成员：](#成员-47)
            * [依赖：](#依赖-47)
    * [+vim](#vim)
        * [better-motion](#better-motion)
            * [身份：](#身份-47)
            * [成员：](#成员-48)
            * [依赖：](#依赖-48)
        * [ctrlp](#ctrlp)
            * [身份：](#身份-48)
            * [成员：](#成员-49)
            * [依赖：](#依赖-49)
        * [text-align](#text-align)
            * [身份：](#身份-49)
            * [成员：](#成员-50)
            * [依赖：](#依赖-50)
        * [which-key](#which-key)
            * [身份：](#身份-50)
            * [成员：](#成员-51)
            * [依赖：](#依赖-51)

<!-- vim-markdown-toc -->

---

<!-- Object info -->

---

## layer

### +checkers

#### syntax-checking

##### 身份

语法检查layer

##### 成员

- w0rp/ale
- vim-syntastic/syntastic

##### 依赖

为了使语法检查有效，需要事先安装一些外部工具，例如Python语言的`flake8`

### +completion

#### asyncomplete

##### 身份

异步补全layer

##### 成员

- prabirshrestha/asyncomplete.vim
- prabirshrestha/asyncomplete-lsp.vim

##### 依赖

无

#### auto-completion

##### 身份

自动补全layer

##### 成员

太多并且判断条件太杂，懒得记

##### 依赖

无

#### deoplete

##### 身份

neovim专用自动补全layer

##### 成员

- Shougo/deoplete.nvim
- Shougo/deoplete.nvim
- roxma/nvim-yarp
- roxma/vim-hug-neovim-rpc
- eagletmt/neco-ghc
- Shougo/neco-vim
- sebastianmarkow/deoplete-rust
- zchee/deoplete-go

##### 依赖

无

#### unite

##### 身份

用户界面支持layer

##### 成员

- Shougo/unite.vim

##### 依赖

该layer中的某些命令可能需要其他layer的支持

##### 快捷键

, + m

### +distributions

#### better-defaults

##### 身份

优化space-vim的layer

##### 成员

- kshenoy/vim-signature
- tpope/vim-rsi
- xtal8/traces.vim
- dominikduda/vim_current_word
- t9md/vim-choosewin
- mhinz/vim-startify
- ntpeters/vim-better-whitespace
- haya14busa/is.vim
- osyo-manga/vim-anzu
- google/vim-searchindex
- haya14busa/incsearch.vim
- haya14busa/incsearch-fuzzy.vim

##### 依赖

无

##### 快捷键

 

#### spacevim

##### 身份：

##### 成员：

- 

##### 依赖：

### +fun

#### emoji

##### 身份：

##### 成员：

- 

##### 依赖：

#### games

##### 身份：

##### 成员：

- 

##### 依赖：

#### goyo

##### 身份：

##### 成员：

- 

##### 依赖：

### +lang

#### c-c++

##### 身份：

##### 成员：

- 

##### 依赖：

#### clojure

##### 身份：

##### 成员：

- 

##### 依赖：

#### elixir

##### 身份：

##### 成员：

- 

##### 依赖：

#### elm

##### 身份：

##### 成员：

- 

##### 依赖：

#### erlang

##### 身份：

##### 成员：

- 

##### 依赖：

#### go

##### 身份：

##### 成员：

- 

##### 依赖：

#### graphviz

##### 身份：

##### 成员：

- 

##### 依赖：

#### haskell

##### 身份：

##### 成员：

- 

##### 依赖：

#### html

##### 身份：

##### 成员：

- 

##### 依赖：

#### java

##### 身份：

##### 成员：

- 

##### 依赖：

#### javascript

##### 身份：

##### 成员：

- 

##### 依赖：

#### latex

##### 身份：

##### 成员：

- 

##### 依赖：

#### markdown

##### 身份：

##### 成员：

- 

##### 依赖：

#### python

##### 身份：

##### 成员：

- 

##### 依赖：

#### ruby

##### 身份：

##### 成员：

- 

##### 依赖：

#### rust

##### 身份：

##### 成员：

- 

##### 依赖：

#### scala

##### 身份：

##### 成员：

- 

##### 依赖：

#### solidity

##### 身份：

##### 成员：

- 

##### 依赖：

#### typescript

##### 身份：

##### 成员：

- 

##### 依赖：

#### vue

##### 身份：

##### 成员：

- 

##### 依赖：

#### wasm

##### 身份：

##### 成员：

- 

##### 依赖：


### +misc

#### chinese

##### 身份：

##### 成员：

- 

##### 依赖：

### +programming

#### code-snippets

##### 身份：

##### 成员：

- 

##### 依赖：

#### editing

##### 身份：

##### 成员：

- 

##### 依赖：

#### formatting

##### 身份：

##### 成员：

- 

##### 依赖：

#### programming

##### 身份：

##### 成员：

- 

##### 依赖：

### +themes

#### airline

##### 身份：

##### 成员：

- 

##### 依赖：

#### lightline

##### 身份：

##### 成员：

- 

##### 依赖：

### +tools

#### cscope

##### 身份：

##### 成员：

- 

##### 依赖：

#### ctags

##### 身份：

##### 成员：

- 

##### 依赖：

#### docker

##### 身份：

##### 成员：

- 

##### 依赖：

#### file-manager

##### 身份：

##### 成员：

- 

##### 依赖：

#### fzf

##### 身份：

##### 成员：

- 

##### 依赖：

#### lsp

##### 身份：

##### 成员：

- 

##### 依赖：

#### tmux

##### 身份：

##### 成员：

- 

##### 依赖：

#### ycmd

##### 身份：更强大的自动补全layer

##### 成员：

- 

##### 依赖：

### +version-control

#### git

##### 身份：

##### 成员：

- 

##### 依赖：

#### github

##### 身份：

##### 成员：

- 

##### 依赖：

### +vim

#### better-motion

##### 身份：

##### 成员：

- 

##### 依赖：

#### ctrlp

##### 身份：

##### 成员：

- 

##### 依赖：

#### text-align

##### 身份：

##### 成员：

- 

##### 依赖：

#### which-key

##### 身份：

##### 成员：

- 

##### 依赖：
