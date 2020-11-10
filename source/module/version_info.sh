#!/usr/bin/env bash

: <<!
Name: version_info.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-07-30 19:45:01

Description: 版本信息

Attentions:
-

Depends:
-
!

####################################################################
#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#
####################################################################
# program name
readonly name=$(basename "$0")
# program version
readonly major_version=0.1
readonly minor_version=20200202
readonly rel_version=1

####################################################################
#+++++++++++++++++++++++++ Define Function ++++++++++++++++++++++++#
####################################################################
#------------------------- Info Function
function versionInfo() {
  echo -e "\e[1m$name\e[0m version (\e[1m$major_version-$minor_version.$rel_version\e[0m)"
}

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
versionInfo
