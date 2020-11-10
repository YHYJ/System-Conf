# README

系统级配置目录(`/etc`)下需要备份的文件

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [docker](#docker)
* [tlp](#tlp)
* [laptop-mode.conf](#laptop-modeconf)
* [pacman](#pacman)
    * [pacman.conf](#pacmanconf)
    * [pacman.d/](#pacmand)
* [00-mount-internal.rules](#00-mount-internalrules)
* [modprobe.d/](#modprobed)
* [modules-load.d/](#modules-loadd)
* [profile](#profile)
    * [profile](#profile-1)
    * [profile.d/](#profiled)
* [30-touchpad.conf](#30-touchpadconf)
* [sddm.conf](#sddmconf)
* [systemd](#systemd)
* [makepkg.conf](#makepkgconf)

<!-- vim-markdown-toc -->

---

---

## docker

docker配置文件

> ./docker/daemon.json --> /etc/docker/daemon.json
>
> ./docker/override.conf --> /etc/systemd/system/docker.service.d/override.conf

## tlp

tlp的配置文件

> ./default/tlp --> /etc/default/tlp

## laptop-mode.conf

lattop-mode-tools的配置文件

> ./laptop-mode/laptop-mode.conf --> /etc/laptop-mode/laptop-mode.conf

## pacman

### pacman.conf

pacman配置文件

> ./pacman.conf --> /etc/pacman.conf

### pacman.d/

额外的pacman配置文件

> ./pacman.d/* --> /etc/pacman.d/

## 00-mount-internal.rules

使普通用户可以通过文件管理器对外置存储设备进行挂载/卸载的工具

- 安装udevil包
- 将用户加入到storage组

> ./polkit-1/rules.d/00-mount-internal.rules --> /etc/polkit-1/rules.d/00-mount-internal.rules

## modprobe.d/

内核模块配置文件

- bbswitch.conf -- 加载内核模块**bbswitch**时候的参数
- nouveau.conf -- 屏蔽nouveau和nvidia模块：独立显卡
- webcam.conf -- 屏蔽wencam模块：摄像头

> ./modprobe.d/* --> /etc/modprobe.d/

## modules-load.d/

开机自动加载的模块

- virtio.conf -- 自动加载virtio相关模块来为kvm启动准虚拟化

> ./modules-load.d/* --> /etc/modules-load.d/

## profile

### profile

系统变量定义文件

> ./profile --> /etc/profile

### profile.d/

额外的系统变量定义文件

> ./profile.d/* --> /etc/profile.d/

## 30-touchpad.conf

触摸板配置文件

- 使用`xinput list`命令确定输入设备的设备名

> ./X11/xorg.conf.d/30-touchpad.conf --> /etc/X11/xorg.conf.d/30-touchpad.conf

## sddm.conf

SDDM配置文件

- SDDM的主题文件存放目录是/usr/share/sddm/themes/

> ./sddm.conf --> /etc/sddm.conf
>
> [在这里下载主题](https://store.kde.org/browse/cat/101/)
>
> 主题列表：
>
> - archlinux
> - breeze
> - Breeze-Chameleon-v.2
> - Colorful-Kruna
> - Crown-Teal-v.2
> - Dark-openSUSE
> - Dark-openSUSE-v.2
> - elarun
> - Elegant
> - futuristic
> - harmony-v.3
> - KDE-Story
> - maldives
> - maya
> - Moderate-Blue
> - Orange
> - Purple
> - Red-Black
> - sddm-lain-wired-theme
> - Sleek
> - solarized-sddm-theme
> - sugar-dark
> - urbanlifestyle

## systemd

用户手动添加的service

## makepkg.conf

生成软件包时的配置参数
