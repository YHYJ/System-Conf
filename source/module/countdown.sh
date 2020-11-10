#!/usr/bin/env bash

: <<!
Name: countdown.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-06-22 12:04:45

Description: 倒计时模块

Attentions:
-

Depends:
-
!

####################################################################
#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#
####################################################################
#------------------------- Exit Code Variable
readonly normal=0 # 一切正常

#------------------------- Parameter Variable
# time variable
readonly duration=10  # 倒计时时长
readonly gap=-1       # 两个倒计时之间的差值
readonly end=0        # 到此为止
readonly sleep_time=1 # 倒计时之间的间隔

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
for sec in $(seq -w $duration $gap $end); do
  echo -en "Countdown \\e[31m$sec\\e[0m\r"
  if [ "$sec" -eq "$end" ]; then
    echo -e "\nGame over!"
    exit $normal
  fi
  sleep $sleep_time
done
