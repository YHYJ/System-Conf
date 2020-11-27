#!/usr/bin/env bash

: <<!
Name: editor.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2019-07-12 10:03:25

Description: 设置默认编辑器
!

nvim='/usr/bin/nvim'
vim='/usr/bin/vim'
vi='/usr/bin/vi'

if [[ -x $nvim ]]; then
  export EDITOR="$nvim"
elif [[ -x $vim ]]; then
  export EDITOR="$vim"
else
  export EDITOR="$vi"
fi
