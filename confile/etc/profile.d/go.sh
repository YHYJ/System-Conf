: <<!
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-06-05 10:28:00

Description: 配置go变量
!

if command -v go &>/dev/null; then
  gobin=$(go env GOBIN)
  export PATH="$PATH:$gobin"
fi
