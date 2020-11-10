# Title

Guide

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [NVIDIA](#nvidia)
    * [1. 查看显卡信息](#1-查看显卡信息)
    * [2. 安装对应驱动](#2-安装对应驱动)
    * [3. 32位](#3-32位)
    * [4. 重启](#4-重启)
    * [5. 硬件加速](#5-硬件加速)
    * [6. 配置文件](#6-配置文件)
        * [最小配置](#最小配置)
        * [自动配置](#自动配置)
    * [7. nvidia设置工具](#7-nvidia设置工具)

<!-- vim-markdown-toc -->

---

---

## NVIDIA

总体介绍了Nvidia显卡的驱动程序

以下内容适用于linux'或'linux-lts'内核

如果想使用开源驱动，请参阅[Nvidia开源驱动nouveau](https://wiki.archlinux.org/index.php/Nouveau)

如果是Intel/Nvidia的混合显卡机器，请参阅[NVIDIA Optimus](https://wiki.archlinux.org/index.php/NVIDIA_Optimus)

### 1. 查看显卡信息

```bash
$ lspci -k | grep -A 2 -E "(VGA|3D)"
```

### 2. 安装对应驱动

nvidia / nvidia-lts
nvidia-beta / nvidia-llb-dkms
nvidia-390xx-dkms

### 3. 32位

为了获取对32位程序的支持，安装multilib/lib32-nvidia-utils

### 4. 重启

nvidia包会新建一个文件来屏蔽nouveau模块

### 5. 硬件加速

GeForce 8及更高系列显卡支持使用VDPAU进行视频解码加速

### 6. 配置文件

专有nvidia显卡驱动不需要任何Xorg Server配置文件，但是也可以创建一个配置文件（`/etc/X11/xorg.conf.d/20-nvidia.conf`优于`/etc/X11/xorg.conf`）以便调节各种设置，该配置文件可以由NVIDIA Xorg配置工具自动生成

更多配置选项参见[NVIDIA/Tips and tricks#Manual configuration](https://wiki.archlinux.org/index.php/NVIDIA/Tips_and_tricks#Manual_configuration)[NVIDIA/Troubleshooting](https://wiki.archlinux.org/index.php/NVIDIA/Troubleshooting)

#### 最小配置

```bash
Section "Device"
        Identifier "Nvidia Card"
        Driver "nvidia"
        VendorName "NVIDIA Corporation"
        BoardName "GeForce GTX 1050 Ti"
EndSection
```

#### 自动配置

```bash
# nvidia-xconfig
```

### 7. nvidia设置工具

`nvidia-settings`
