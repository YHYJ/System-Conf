#!/usr/bin/env bash

: <<!
Name: ask_question.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-03-27 04:19:23

Description: askQuestion()模块
!

####################################################################
#+++++++++++++++++++++++++ Define Function ++++++++++++++++++++++++#
####################################################################
#------------------------- Feature Function
function askQuestion() {
  while true; do
    # '-e'：允许使用退格键(Backspace)
    # '-t'：读取超时，单位秒(s)
    # '-r'：不将反斜杠(\)视为转义字符
    # '-p'：在获取输入之前显示提示信息
    read -e -t 3 -r -p "$1"
    REPLY=${REPLY:-Y}
    echo
    if [[ "$REPLY" =~ ^[Yy] ]]; then
      return 0
    elif [[ "$REPLY" =~ ^[Nn] ]]; then
      return 1
    else
      echo -e "应输入 Y/y 或 N/n\n"
    fi
  done
}

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
askQuestion "提示信息 [Yy/Nn]"
