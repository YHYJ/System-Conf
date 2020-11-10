#!/usr/bin/env bash

: <<!
Name: exit_code.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-04-27 09:25:38

Description: 定义错误码

Attentions:
-

Depends:
-
!

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
readonly normal=0           # 一切正常
readonly err_file=1         # 文件/路径类错误
readonly err_param=2        # 参数错误
readonly err_fetch=48       # checkupdate错误
readonly err_permission=110 # 权限错误
readonly err_range=122      # 取值范围错误
readonly err_ctrl_c=130     # 接收到INT(Ctrl+C)指令
readonly err_unknown=255    # 未知错误
readonly err_no_program=127 # 未找到命令
