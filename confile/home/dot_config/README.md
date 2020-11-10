# README

给予用户的配置文件目录(`$HOME/.config`)下需要备份的文件

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [deepin](#deepin)
* [dunst](#dunst)
* [fcitx5](#fcitx5)
* [fontconfig](#fontconfig)
* [i3](#i3)
* [mpd](#mpd)
* [neofetch](#neofetch)
* [polybar](#polybar)
* [rofi](#rofi)
* [terminator](#terminator)
* [user-dirs](#user-dirs)
* [yay](#yay)
* [go](#go)
* [locale.conf](#localeconf)
* [gtk](#gtk)
* [chromium](#chromium)

<!-- vim-markdown-toc -->

---

---

## deepin

 deepin-terminal配置文件

> ./deepin/deepin-terminal --> "$HOME"/.config/deepin/deepin-terminal

## dunst

消息通知dunst

> ./dunst/dunstrc --> "$HOME"/.config/dunst/dunstrc

## fcitx5

fcitx5输入法框架

- 皮肤:simple
    - [simple](https://github.com/iovxw/fcitx5-simple-theme.git)

> ./fcitx5 --> "$HOME"/.config/fcitx5

## fontconfig

字体配置

[参考](https://www.reddit.com/r/archlinux/comments/5r5ep8/make_your_arch_fonts_beautiful_easily/)

> ./fontconfig --> "$HOME"/.config/fontconfig

## i3

窗口管理器

- 运行`xev`结合`xmodmap -pke`查看按键的映射
    - `xmomap -pke`的结果已缓存到[键盘映射注释表]([https://github.com/YHYJ/System-Conf/blob/master/Others/%E9%94%AE%E7%9B%98%E6%98%A0%E5%B0%84%E6%B3%A8%E9%87%8A%E8%A1%A8](https://github.com/YHYJ/System-Conf/blob/master/Others/键盘映射注释表))

> ./i3/config --> "$HOME"/.config/i3/config

## mpd

mpd音频播放服务

- 使用`systemctl --user ...`而非root权限管理mpd
- 使用`mpc update`扫描音乐
- 使用`mpc listall | mpc add`将所有歌曲添加到播放列表
- 使用`mpc playlist`查看当前播放列表

> ./mpd/mpd.conf --> "$HOME"/.config/mpd/mpd.conf

## neofetch

查看系统信息

> ./neofetch/config.conf --> "$HOME"/.config/neofetch/config.conf

## polybar

Topbar

- 使用AUR/polybar时，当jsoncpp更新时需要重新编译polybar以链接到新的libjsoncpp.so文件

> ./polybar --> "$HOME"/.config/polybar

## rofi

快速启动器

> ./rofi --> "$HOME"/.config/rofi

## terminator

Terminal

> ./terminator/config --> "$HOME"/.config/terminator/config

## user-dirs

用户目录文件夹模板

> ./user-dirs --> "$HOME"/.config

## yay

yay配置文件

> ./yay/config.json --> "$HOME"/.config/yay/config.json

## go

golang环境变量配置文件

> ./go/env --> "$HOME"/.config/go/env

## locale.conf

用户级locale配置文件，优先级高于`/etc/locale.conf`

> ./locale/locale.conf --> "$HOME"/.config/locale.conf

## gtk

GTK(GTK2.0/GTK3.0)主题配置文件

> ./gtk/gtk-3.0 --> "$HOME"/.config/gtk-3.0
>
> ./gtk/gtk-2.0 --> "$HOME"/.config/gtk-2.0
>
> ./gtk/gtkrc-2.0 --> "$HOME"/.gtkrc-2.0

## chromium

为chromium开启视频硬解码

> ./chromium/chromium-flags.conf --> "$HOME"/.config/chromium-flags.conf
