#!/usr/bin/env bash

: <<!
Name: ruby.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-11-26 17:46:25

Description: 配置ruby变量

gem_bin_path的值根据ruby安装时的版本可能是不确定的
!

gem_bin_path="$HOME/.gem/ruby/2.7.0/bin"

if [[ -d $gem_bin_path ]]; then
  export GEMBINPATH="$gem_bin_path"
  export PATH="$PATH:$GEMBINPATH"
fi
