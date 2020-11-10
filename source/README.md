# README

文件功能概述

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Application](#application)
    * [polybar-script](#polybar-script)
        * [mail](#mail)
        * [redshift](#redshift)
* [backup](#backup)
* [check](#check)
* [configure](#configure)
* [dev](#dev)
* [git](#git)
* [install](#install)
* [module](#module)
* [MySource](#mysource)
* [MySystem](#mysystem)
    * [build](#build)
    * [genesis](#genesis)
* [tool](#tool)

<!-- vim-markdown-toc -->

---


---

## Application

### polybar-script

polybar的脚本

> 可能有多个语言的版本

#### mail

polybar邮件操作脚本

- go-version

    go版

- python-version

    python版

#### redshift

- polybar-script_redshift-info

    显示redshift信息

## backup

- backup-sddm-theme

    备份SDDM的主题文件

## check

- check-Arch-pacman_useless_file

    检查pacman数据库之外的文件，这些文件通常是第三方程序以普通方式(configure;make;make install三剑客)安装的

- check-graphics

    检测系统显卡信息

## configure

- configure-docker

    配置docker daemon，指定docker root

- configure-dtags

    dtag添加新增的repo标签

- configure-git

    配置git

- configure-pip

    配置pip使用豆瓣源

## dev

开发版程序源码的存储位置

## git

- git-clone

    clone我的仓库

## install

- install-AUR_Helper

    安装AUR helper -- yay

- install-rust

    安装rust开发环境

- install-spacevim

    安装space-vim

- install-ss_go-server

    在服务器上安装shadowsocks-go

## module

- argument_parse.sh

    参数解析模块

- ask_question.sh

    A&Q模块

- check_user.sh

    用户检测模块

- dialog_tui.sh

    对话框模块

- exit_code.sh

    错误码模块

## MySource

必备程序

- backup

    备份程序

    > 使用方法执行`backup help`查看

- checkupdates-notify

    安全的检查系统更新并通知

- http-server

    开启一个临时的HTTP服务

    > 使用方法执行`http-server --help`查看

- program-manager

    将source/MySource里的程序安装到/usr/local/bin

    > 包括自身

- mylock

    锁屏程序

- polybar-script_checkupdates

    安全的检查系统更新

    > polybar插件

- polybar-script_mail

    邮件操作

    > polybar插件

- polybar-script_trash

    操作回收站

    > polybar插件

- polybar-script_uptime-info

    显示系统已启动时间

    > polybar脚本

- polybar-script_usb-udev

    操作USB存储设备

    > polybar脚本

- polybar-script_weather

    查询天气

    > polybar脚本

- rolling-count

    查询系统已更新次数

- save-docker-images

    备份本地所有docker image

    > 详情运行`save-docker-images help`

- startfm

    在指定位置打开文件管理器

- system-slim

    检查并卸载孤立的软件包

- terminal-time

    录制终端操作

- time-terminal

    回放终端操作

## MySystem

### build

系统搭建程序

- install-packages

    根据备份的包列表批量安装

### genesis

系统初始化程序

- init-pacman

    初始化pacman的可信密匙清单

## tool

工具程序

- benchmarker

    测试存储设备性能

- clean

    清理编译器生成的垃圾文件
