#!/usr/bin/env bash

: <<!
Name: browser.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2019-07-12 10:03:25

Description: 设置默认浏览器
!

browser='/usr/bin/chromium'

if [[ -x $browser ]]; then
  export BROWSER="$browser"
fi
