#!/usr/bin/env bash

: <<!
Name: indirect_reference.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-07-27 19:26:31

Description: 间接引用变量

Attentions:
- 通过!间接引用变量
- 直接引用的变量的value必须和被间接引用的变量的key相同

Depends:
-
!

####################################################################
#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#
####################################################################
#------------------------- Parameter Variable
# test variable
readonly direct_var='indirect_var'
readonly indirect_var='indirect'

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
echo "${!direct_var}"
