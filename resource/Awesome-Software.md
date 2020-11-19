# Awesome Software

常用优质软件

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [数据库](#数据库)
* [多媒体](#多媒体)
* [能源](#能源)
* [实用工具](#实用工具)
* [文件](#文件)
* [编辑器](#编辑器)
* [终端](#终端)
* [网络](#网络)
* [开发](#开发)
* [浏览器](#浏览器)
* [虚拟机](#虚拟机)
* [字体](#字体)

<!-- vim-markdown-toc -->

---

CLI：命令行工具
GUI：图形界面
Service：服务
Library：库
System：系统组件（包含字体）

---

## 数据库

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| iredis                     | 具有自动完成和语法高亮的交互式Redis客户端                  | CLI     | 非必要 |
| pgcli                      | 具有自动完成和语法高亮的PostgreSQL命令行客户端             | CLI     | 非必要 |
| litecli                    | 具有自动完成和语法高亮的SQLite命令行客户端                 | CLI     | 非必要 |
| mycli                      | 具有自动完成和语法高亮的MySQL命令行客户端                  | CLI     | 非必要 |
| dbeaver                    | 多数据库客户端                                             | GUI     | 必要   |
| freetds                    | 用于访问Sybase和MS SQL Server数据库的库                    | Library | 非必要 |
| pgsync                     | 将数据从一个PG同步到另一个PG                               | CLI     | 非必要 |

## 多媒体

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| chafa                      | 图像->文本转换器                                           | CLI     | 非必要 |
| ciano                      | 多媒体文件转换器                                           | GUI     | 非必要 |
| cmatrix                    | 屏保                                                       | CLI     | 非必要 |
| feh                        | 图片浏览和壁纸设置器                                       | CLI     | 必要   |
| gimp                       | 图像处理程序                                               | GUI     | 非必要 |
| mypaint                    | 画板                                                       | GUI     | 非必要 |
| pavucontrol                | 音频设备控制器                                             | GUI     | 必要   |
| peek                       | 屏幕录制器                                                 | GUI     | 非必要 |
| inkscape                   | 专业矢量图形编辑器                                         | GUI     | 非必要 |
| drawio-desktop-bin         | web打包的制图软件                                          | GUI     | 必要   |

## 能源

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| acpi                       | 能源状态客户端                                             | CLI     | 必要   |
| acpid                      | ACPI事件守护程序                                           | Service | 必要   |
| powertop                   | 功耗和电源管理问题诊断                                     | CLI     | 必要   |

## 实用工具

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| rofi                       | 程序启动器、窗口切换器                                     | GUI     | 必要   |
| tig                        | git管理器                                                  | CLI     | 必要   |
| bat                        | 带有语法高粱和git集成的cat克隆                             | CLI     | 必要   |
| asp                        | Arch Linux构建源文件管理工具                               | CLI     | 非必要 |
| ncdu                       | 带有ncurses接口的磁盘使用情况分析器                        | CLI     | 必要   |
| xsel                       | 剪切板管理器                                               | CLI     | 必要   |
| meld                       | 差异比较工具                                               | GUI     | 必要   |
| axel                       | 多线下载加速器                                             | CLI     | 必要   |
| tldr                       | 命令用法手册                                               | CLI     | 必要   |
| dkms                       | 动态内核模块支持，用于（自动重新）编译内核代码树之外的模块 | CLI     | 非必要 |
| dtags                      | 路径tag快速跳转                                            | CLI     | 必要   |
| shred                      | 覆盖文件以完全删除                                         | CLI     | 非必要 |
| zenity                     | 从shell脚本显示图形对话框                                  | CLI     | 非必要 |
| dialog                     | 在终端中显示对话框的工具                                   | CLI     | 非必要 |
| wmname                     | 设置窗口管理器名称的工具                                   | CLI     | 非必要 |
| arandr                     | xrandr的前端界面，同于配置显示器                           | GUI     | 必要   |
| scrcpy                     | 安卓设备控制器                                             | GUI     | 非必要 |
| namcap                     | pacman安装包分析器                                         | CLI     | 必要   |
| pacvis                     | pacman包依赖关系可视化分析器                               | CLI     | 非必要 |
| pacgraph                   | pacman包依赖关系可视化分析器                               | CLI     | 非必要 |
| seahorse                   | PGP密钥管理器                                              | GUI     | 必要   |
| hardinfo                   | 系统信息和基准测试工具                                     | GUI     | 非必要 |
| progress                   | 显示正在运行的coreutils命令及其信息                        | CLI     | 必要   |
| redshift                   | 根据经纬度和时间调节屏幕色温                               | Service | 必要   |
| filezilla                  | FTP、FTPS、SFTP客户端                                      | GUI     | 必要   |
| trash-cli                  | 文件回收站                                                 | CLI     | 必要   |
| gtk-chtheme                | 用户切换gtk程序主题                                        | GUI     | 非必要 |
| qalculate-gtk              | 科学计算器                                                 | GUI     | 必要   |
| xdg-user-dirs              | 用户目录管理器                                             | CLI     | 必要   |
| container-diff             | Docker container差异比较工具                               | CLI     | 非必要 |
| archlinuxcn-keyring        | Arch Linux CN PGP密钥环                                    | System  | 必要   |
| archlinuxcn-mirrorlist-git | Arch Linux CN仓库镜像列表                                  | System  | 必要   |
| compton-conf-git           | X合成器picom（原compton）配置工具                          | GUI     | 非必要 |
| baidupcs-go-bin            | 百度网盘终端实用程序（Go版）                               | CLI     | 非必要 |
| packetsender               | 网络实用程序，用于发送/接收TCP和UDP数据包                  | GUI     | 非必要 |

## 文件

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| thunar                     | 文件管理器                                                 | GUI     | 必要   |
| autojump                   | 根据关键字快速浏览文件系统                                 | CLI     | 必要   |
| catfish                    | 多功能文件搜索器                                           | GUI     | 必要   |
| fdupes                     | 检索出内容重复的文件                                       | CLI     | 必要   |
| fpp                        | 检索定向到它的输出中的可编辑文件路径                       | CLI     | 必要   |
| lsof                       | 列出被运行中的进程打开的文件                               | CLI     | 必要   |
| ranger                     | vim-like的终端文件管理器                                   | CLI     | 非必要 |
| rsync                      | 文件差异同步服务                                           | Service | 非必要 |

## 编辑器

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| hexer                      | vim-like的多缓冲区二进制文件编辑器                         | CLI     | 必要   |

## 终端

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| termite                    | Terminal                                                   | GUI     | 非必要 |
| terminator                 | Terminal                                                   | GUI     | 必要   |

## 网络

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| v2ray                      | v2ray代理                                                  | Service | 非必要 |
| shadowsocks-libev          | SSR                                                        | Service | 必要   |
| speedtest-cli              | 带宽测试器                                                 | CLI     | 必要   |
| bandwhich                  | 终端带宽利用率工具                                         | TUI     | 非必要 |
| tcpdump                    | 数据包分析器                                               | CLI     | 非必要 |
| privoxy                    | 具有高级过滤功能的web代理                                  | Service | 必要   |
| corkscrew                  | 通过HTTP代理连接SSH                                        | CLI     | 非必要 |
| proxychains-ng             | Socks & Http代理                                           | CLI     | 非必要 |
| linux-wifi-hotspot         | 创建AP                                                     | GUI     | 非必要 |

## 开发

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| tokei                      | 代码统计工具                                               | CLI     | 必要   |
| autopep8                   | 自动格式化Python代码以使其符合PEP 8样式指南                | CLI     | 必要   |
| lldb                       | 高性能调试器                                               | CLI     | 非必要 |
| postman                    | API测试器                                                  | GUI     | 必要   |
| shfmt                      | shell脚本格式化工具                                        | CLI     | 必要   |
| d-feet                     | D-Bus调试器                                                | GUI     | 非必要 |
| shellcheck                 | shell脚本语法检查器                                        | CLI     | 必要   |
| valgrind                   | 程序内存问题查找工具                                       | CLI     | 非必要 |
| sokit                      | 一个TCP＆UDP数据包发送/接收/传输工具                       | GUI     | 非必要 |
| qmodbus                    | 基于Qt的Modbus master实现                                  | GUI     | 非必要 |
| cutecom                    | 串口调试工具                                               | GUI     | 非必要 |

## 浏览器

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| w3m                        | 基于文本的web浏览器                                        | CLI     | 非必要 |

## 虚拟机

| 包名                       | 描述                                                       | 属性    | 必要性 |
| -------------------------- | ---------------------------------------------------------- | ------- | ------ |
| virt-manager               | kvm虚拟机管理器                                            | GUI     | 必要   |
| qemu-headless              | 没有GUI的QEMU                                              | CLI     | 必要   |

## 字体

> 在安装了nerd-fonts-complete字体的情况下awesome-terminal-fonts和powerline-fonts是非必要的

| 包名                              | 描述                           | 属性   | 必要性 |
| ---                               | ---                            | ---    | ---    |
| nerd-fonts-complete               | 巨量字体补丁，包含图标         | System | 必要   |
| ttf-meslo-nerd-font-powerlevel10k | 用于zsh主题powerlevel10k的字体 | System | 必要   |
| awesome-terminal-fonts            | 用于Powerline的字体和图标      | System | 非必要 |
| powerline-fonts                   | Powerline的字体补丁            | System | 非必要 |
