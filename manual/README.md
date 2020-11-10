# README

需要备份到优盘的文件的索引

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [Docker](#docker)
* [App](#app)
* [Font](#font)
* [Picture](#picture)
* [KDE](#kde)
* [Mail](#mail)
* [Proxy](#proxy)
    * [Shadowsocks](#shadowsocks)
    * [ProjectV](#projectv)
    * [Privoxy](#privoxy)
    * [Corkscrew](#corkscrew)
* [Guake](#guake)

<!-- vim-markdown-toc -->

---

---

## Docker

Docker

> 备份到U盘
>
> 备份命令：`save-docker-images`
>
> $HOME/Documents/LocalBackups/docker/Mydocker.images

## App

不在源（包括source和AUR）里的包

> 备份到U盘
>
> $HOME/Documents/App

## Font

手动安装的字体

> ttf-file
>
> [ohmyzsh主题powerlevel10k需要的字体](https://github.com/romkatv/powerlevel10k#manual-font-installation)
>
> [显示icon必要的字体](https://github.com/romkatv/powerlevel10k#fonts)
>
> [Yahei Monaco Hybrid 混合字体](https://github.com/maxsky/Yahei-Monaco-Hybrid-Font)

## Picture

图片

> Pictures --> "$HOME"/Pictures

## KDE

KDE桌面快捷键备份文件

> 手动备份
>
> kde/shortcut

## Mail

Thunderbird通讯录备份文件

> 手动备份
>
> mail

## Proxy

Proxy配置文件

### Shadowsocks

shadowsocks

> proxy/Shadowsocks/config --> /etc/shadowsocks/config
>
> proxy/Shadowsocks/shadowsocks-go@.service --> /etc/systemd/system/shadowsocks-go@.service

### ProjectV

v2ray

> proxy/ProjectV/config.json --> /etc/v2ray/config.json

### Privoxy

socks转http/https

> proxy/Privoxy/config --> /etc/privoxy/config

### Corkscrew

http转ssh

> proxy/Corkscrew/config --> $HOME/.ssh/config

## Guake

下拉式Terminal

> 备份命令：`guake --save-preferences=guake.conf`
>
> guake
