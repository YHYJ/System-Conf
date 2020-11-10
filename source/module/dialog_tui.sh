#!/usr/bin/env bash

: <<!
Name: dialog_tui.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-05-13 15:30:12

Description: 使用dialog显示TUI界面

Attentions:
- '--clear'参数清除box，但不清除背景色
- 'clear'彻底清屏

Depends:
- dialog
!

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
readonly result=$(dialog --stdout --clear --title "请选择网卡" --checklist "网卡列表" 0 0 0 "lo" "本地环回" "off" "wlp3s0" "无线网卡" "off")
clear
echo "$result"
