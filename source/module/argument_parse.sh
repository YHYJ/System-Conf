#!/usr/bin/env bash

: <<!
Name: argument_parse.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-03-27 17:15:34

Description: argumentParse()模块

argumentParse                                        # 无选项，输出help信息
argumentParse -h -v                                  # 短选项
argumentParse --help --version                       # 长选项
argumentParse -t test --test Test -ahola --arg=1516  # 必需参数和可选参数
  """
  在getopt中，长短选项都可以定义必需参数和可选参数
  在选项后没跟冒号代表该选项没有参数，一个冒号代表有必需参数，两个冒号代表有可选参数
  对于短选项：
    必需参数 - 参数和选项之间的空格可有可无，例如上面的[-t test]也可以写成[-ttest]
    可选参数 - 参数和选项之间不能有空格，例如上面的[-ahola]只有这种写法
  对于长选项：
    必需参数 - 参数和选项之间要有空格或等号，形如[--test Test]或[--test=Test]
    可选参数 - 参数和选项之间要有等号，例如上面的[--arg=1516]只有这种写法
  当然，所有参数都可以加上引号
!

####################################################################
#+++++++++++++++++++++++++ Define Variable ++++++++++++++++++++++++#
####################################################################
#------------------------- Exit Code Variable
readonly normal=0        # 一切正常
readonly err_param=2     # 参数错误
readonly err_unknown=255 # 未知错误

####################################################################
#+++++++++++++++++++++++++ Define Function ++++++++++++++++++++++++#
####################################################################
#------------------------- Feature Function
function argumentParse() {
  # 给定了选项，交给getopt处理
  # getopt默认短选项可以连写，需要处理
  TEMP=$(getopt --options ":hvt:a::" --longoptions "help,version,test:,arg::" -n "argumentParse" -- "$@")
  eval set -- "$TEMP"

  if [[ ${#@} -lt 2 ]]; then
    # 测定选项及参数长度，最小应为2
    echo -e "helpinfo"
    exit $err_param
  else
    while true; do
      case $1 in
      -t | --test)
        case $2 in
        [a-z]* | [A-Z]*)
          echo -e "testinfo: $2"
          shift 2
          ;;
        "")
          echo -e "未给定必需参数"
          shift 2
          ;;
        *)
          echo -e "参数值错误"
          shift 2
          ;;
        esac
        ;;
      -a | --arg)
        case $2 in
        [a-z]* | [A-Z]*)
          echo -e "Option '$1'(Aa-Zz), argumet '$2'"
          shift 2
          ;;
        [0-9]*)
          echo -e "Option '$1'(0-9), argumet '$2'"
          shift 2
          ;;
        "")
          echo -e "Option '$1'(\"\"), argumet '$2'"
          shift 2
          ;;
        *)
          echo -e "Option '$1', ?"
          shift 2
          ;;
        esac
        ;;
      -h | --help)
        echo -e "helpinfo"
        exit $normal
        ;;
      -v | --version)
        echo -e "versioninfo"
        exit $normal
        ;;
      --)
        shift 1
        break
        ;;
      *)
        echo -e "程序错误"
        exit $err_unknown
        ;;
      esac
    done
  fi
}

####################################################################
#++++++++++++++++++++++++++++++ Main ++++++++++++++++++++++++++++++#
####################################################################
argumentParse -t test --test Test -ahola --arg=1516
