:<<!
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2019-07-12 10:03:25

Description: 配置nim变量
!

nim_path="$HOME/.nim"

if [[ -d $nim_path ]]; then
  export NIMPATH="$nim_path"
  export PATH="$PATH:$NIMPATH/bin"
fi
