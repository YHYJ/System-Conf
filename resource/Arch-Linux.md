# Arch Linux安装流程

过程记录

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [1 安装前的准备](#1-安装前的准备)
    * [1.1 验证签名](#11-验证签名)
    * [1.2 启动到live环境](#12-启动到live环境)
    * [1.3 键盘布局和控制台字体](#13-键盘布局和控制台字体)
        * [1.3.1 键盘布局](#131-键盘布局)
        * [1.3.2 控制台字体](#132-控制台字体)
    * [1.4 验证启动模式](#14-验证启动模式)
    * [1.5 连接到因特网](#15-连接到因特网)
    * [1.6 更新系统时间](#16-更新系统时间)
    * [1.7 建立硬盘分区](#17-建立硬盘分区)
        * [1.7.1 UEFI with GPT](#171-uefi-with-gpt)
        * [1.7.2 BIOS with MBR](#172-bios-with-mbr)
    * [1.8 格式化分区](#18-格式化分区)
    * [1.9 挂载分区](#19-挂载分区)
    * [1.10 自动挂载NTFS](#110-自动挂载ntfs)
* [2 安装](#2-安装)
    * [2.1 选择镜像源](#21-选择镜像源)
    * [2.2 安装必须的软件包](#22-安装必须的软件包)
* [3 配置系统](#3-配置系统)
    * [3.1 Fstab](#31-fstab)
    * [3.2 Chroot](#32-chroot)
    * [3.3 时区](#33-时区)
    * [3.4 本地化](#34-本地化)
    * [3.5 网络](#35-网络)
    * [3.6 Initramfs](#36-initramfs)
    * [3.7 Root密码](#37-root密码)
    * [3.8 a安装引导程序](#38-a安装引导程序)
* [4 重启](#4-重启)
* [5 用户和组](#5-用户和组)
    * [5.1 添加登录用户](#51-添加登录用户)
    * [5.2 将用户添加到组](#52-将用户添加到组)
* [6 之后的工作](#6-之后的工作)

<!-- vim-markdown-toc -->

---

依赖：

1. 启动介质
2. 网络连接

启动参数：

1. 参阅[README.bootparams](https://projects.archlinux.org/archiso.git/tree/docs/README.bootparams)获取一系列的启动参数
2. 使用`cat /proc/cmdline`命令验证是否应用了给定的启动参数

必备软件包：

- wpa_supplicant
- networkmanager
- dialog
- zsh
- gvim

---

## 1 安装前的准备

### 1.1 验证签名

在制作启动介质之前建议验证所下载文件的签名，特被是从HTTP镜像源下载的文件，可能会受到恶意镜像的拦截

在一个已安装`gnupg`的系统上，下载PGP签名(under Checksums)文件，在**ISO文件所在路径**使用以下命令进行验证：

```bash
$ gpg --keyserver-options auto-key-retrieve --verify /path/to/archlinux-version-x86_64.iso.sig
```

或者在一台已安装了Arch Linux的计算机上通过以下方式验证：

```bash
$ pacman-key -v /path/to/archlinux-version-x86_64.iso.sig
```

> 如果是从镜像站点而非[archlinux.org](https://archlinux.org/download/)下载的话，则签名是可以被伪造的。在这种情况下，确保用来解码签名的公钥是被另一个可信的'key'签署的
>
> `gpg`命令可以输出公钥的指纹。另一种验证签名的方法是确保公钥的指纹等于其中一位签署了ISO文件的[Arch Linux开发者](https://www.archlinux.org/people/developers/)的指纹

### 1.2 启动到live环境

live环境可以从U盘、光盘或者带有[PXE](https://wiki.archlinux.org/index.php/PXE)的网络启动进入

- 选择从带有Arch安装文件的媒介启动通常是在电脑开机自检的时候按下某个按键（具体的按键一般会在启动画面有提示）
- 当Arch菜单出现时，选择'Boot Arch Linux'并按"Enter"键进入live环境
- live环境中将会以root的身份登录进一个[虚拟控制台](https://en.wikipedia.org/wiki/Virtual_console)，默认的SHELL是Zsh

如果向一边安装一边用Elinks（一款文本模式的Web浏览器）查看指南，可以使用"Alt+箭头"快捷键切换不同的控制台

### 1.3 键盘布局和控制台字体

#### 1.3.1 键盘布局

控制台键盘布局默认为'us'（美式键盘映射）。执行以下命令列出所有可用的键盘布局：

```bash
# ls /usr/share/kbd/keymaps/**/*.map.gz
```

如果想要更改键盘布局，可以将一致的文件名添加进[loadkeys(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/loadkeys.1)，但需要省略路径和扩展名，比如要添加[German](https://en.wikipedia.org/wiki/File:KB_Germany.svg)键盘布局：

```bash
# loadkeys de-latin1
```

#### 1.3.2 控制台字体

[控制台字体](https://wiki.archlinux.org/index.php/Console_fonts)位于`/usr/share/kbd/consolefonts`，设置方式请参考[setfont(8)](https://jlk.fjfi.cvut.cz/arch/manpages/man/setfont.8)

### 1.4 验证启动模式

如果已在主板上启用了[UEFI](https://wiki.archlinux.org/index.php/UEFI)模式，[Archiso](https://wiki.archlinux.org/index.php/Archiso)将会使用[systemd-boot](https://wiki.archlinux.org/index.php/Systemd-boot_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))来启动Arch Linux，可以列出[efivars](https://wiki.archlinux.org/index.php/UEFI#UEFI_variables)目录以验证启动模式：

```bash
# ls /sys/firmware/efi/efivars
```

如果目录不存在，系统可能以[BIOS](https://en.wikipedia.org/wiki/BIOS)或CSM模式启动

### 1.5 连接到因特网

1. 检查是否启用了网络接口：

    ```bash
    # ip l
    ```

2. 连接当网络（有线网络或无线网络）

    无线网络使用`wifi-menu`命令，根据TUI的提示操作，[详见](https://wiki.archlinux.org/index.php/Wireless_network_configuration)
    live系统在启动时使用[dhcpcd](https://wiki.archlinux.org/index.php/Dhcpcd)(`dhcpcd@interface.service`)配置[有线设备](https://git.archlinux.org/archiso.git/tree/configs/releng/airootfs/etc/udev/rules.d/81-dhcpcd.rules)

3. 检查网络连接

    ```bash
    # ping baidu.com
    ```

### 1.6 更新系统时间

1. 启用NTP网络时间同步

    ```bash
    # timedatectl set-ntp true
    ```

2. 设置时区

    默认时区(time zone)是UTC，建议改成上海，否则会比实际时间慢8h

    ```bash
    # timedatectl set-timezone Asia/Shanghai
    ```

可以使用`timedatectl status`命令检查服务状态

### 1.7 建立硬盘分区

对于一个系统，以下的分区是必需的：

- 一个根分区（挂载在根目录）`/`；
- 如果启用了UEFI模式，需要一个[EFI系统分区](https://wiki.archlinux.org/index.php/EFI_system_partition)

> 使用`cfdisk`命令修改分区表
>
> 文件系统支持的话，可以将交换空间设在交换文件(swap file)上

分区示例：

#### 1.7.1 UEFI with GPT

| 挂载点                  | 分区        | 分区类型               | 建议大小   |
| ------                  | ----        | --------               | --------   |
| `/mnt/boot`或`/mnt/efi` | `/dev/sdX1` | EFI sSystem            | 260-512MiB |
| `/mnt`                  | `/dev/sdX2` | Linux root (x86-64)  | 剩余空间   |
| [SWAP]                  | `/dev/sdX3` | Linux Swap | 大于512MiB |


#### 1.7.2 BIOS with MBR

| 挂载点 | 分区        | 分区类型   | 建议大小   |
| ------ | ----        | --------   | --------   |
| `/mnt` | `/dev/sdX1` | Linux      | 剩余空间   |
| [SWAP] | `/dev/sdX2` | Linux Swap | 大于512MiB |

### 1.8 格式化分区

分区建立好后，所建的分区都需要使用适当的文件系统(ext4、xfs...)进行格式化

例如根分区(/)在`/dev/sdX1`上并且要使用'ext4'文件系统，执行以下命令：

```bash
# mkfs.ext4 /dev/sdX1
```

如果某一分区（例如`/dev/sdX2`）作为交换空间使用，则使用`mkswap`将其初始化：

```bash
# mkswap /dev/sdX2
# swapon /dev/sdX2
```

### 1.9 挂载分区

将根分区(/)挂载到`/mnt`，执行以下命令：

```bash
# mount /dev/sdX1 /mnt
```

然后再`/mnt`的基础上创建其他挂载点（比如`/mnt/boot`，参见[1.7 建立硬盘分区](#17-建立硬盘分区)），并挂载其相应的分区

设置完后，[genfstab](https://git.archlinux.org/arch-install-scripts.git/tree/genfstab.in)将会自动检测挂载的文件系统和交换空间

### 1.10 自动挂载NTFS

`genfstab`命令自动生成的'/etc/fstab'文件中关于NTFS的挂载参数是错误的，并不能正常挂载NTFS文件系统，将其挂载参数修改为如下：

```bash
<type>      <options>
ntfs-3g     uid=yj,gid=yj,dmask=0022,fmask=0133,windows_names
```

> 其中'ntfs-3g'参数需要在安装了[ntfs-3g](https://www.archlinux.org/packages/?name=ntfs-3g)或[ntfs-3g-fuse(AUR)](https://aur.archlinux.org/packages/ntfs-3g-fuse/)之后添加
>
> `dmask=0022`使文件夹默认权限为755，`fmask=0133`使文件默认权限为644
>
> `windows_names`使文件名兼容Windows格式

## 2 安装

### 2.1 选择镜像源

文件`/etc/pacman.d/mirrorlist`定义了从哪个软件源下载指定的软件包，在列表中越靠前的镜像在下载软件包时就有越高的优先级，
修改该文件，将地理位置最近的镜像源挪到文件的头部。该文件接下来还将被`pacstrap`拷贝到新系统里，所以请确保设置正确

### 2.2 安装必须的软件包

使用`pacstrap`脚本，安装`base`Meta package和Linux内核及常规硬件的固件：

```bash
# pacstrap /mnt base linux linux-firmware
```

> 其他重要但非必须的软件包组有`base-devel`
>
> 可以将`linux`替换为[kernel](https://wiki.archlinux.org/index.php/Kernel)页面中介绍的其他内核包

`base`软件包并没有包含live环境中的全部程序，[packages.x86_64](https://projects.archlinux.org/archiso.git/tree/configs/releng/packages.x86_64)页面包含了它们的差异

需要额外安装的软件包**可能**有：

- 管理所有[文件系统](https://wiki.archlinux.org/index.php/File_systems)的用户工具
- 访问[RAID](https://wiki.archlinux.org/index.php/RAID)或[LVM](https://wiki.archlinux.org/index.php/LVM)分区的工具
- 未包含在`linux-firmware`中的额外固件
- 联网需要的程序
- 文本编辑器
- 访问man和info页面的工具：`man-db`、`man-pages`和`texinfo`

## 3 配置系统

### 3.1 Fstab

执行以下命令生成[fstab](https://wiki.archlinux.org/index.php/Fstab)文件：

```bash
# genfstab -U /mnt >> /mnt/etc/fstab
```

> **强烈建议**：执行完该命令之后检查一下生成的`/mnt/etc/fstab`文件是否正确

### 3.2 Chroot

[Change root](https://wiki.archlinux.org/index.php/Change_root)到新安装的系统：

```bash
# arch-chroot /mnt
```

> 因为根分区(/)是挂载到`/mnt`的，所以要change root到`/mnt`

### 3.3 时区

之前是为live系统设置了上海(Asia/Shanghai)时区，现在已经change root到了`/mnt`，需要另为它设置时区

1. 设置时区

    ```bash
    # ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
    ```

    > 设置为上海(Asia/Shanghai)时区

2. 生成`/etc/adjtime`

    执行以下命令生成`/etc/adjtime`：

    ```bash
    # hwclock --systohc
    ```

    > `hwclock`是一个时钟管理工具，'--systohc'参数将RTC设置为系统时间
    >
    > 该命令假定硬件时间已被设置为UTC时间
    >
    > `timedatectl status`的输出值中，如果'RTC in local TZ'的值是'no'，代表使用的是UTC时间

### 3.4 本地化

将程序与库文件进行本地化，都依赖于[Locale](https://wiki.archlinux.org/index.php/Locale)

Locale明确规定地域、货币、时区日期的格式、字符排列方式和其他本地化标准等

在`locale.gen`和`locale.conf`两个文件中设置Locale

1. `/etc/locale.gen`

    `/etc/locale.gen`是一个仅包含注释的文本文件，用来指定需要的本地化类型，只需移除对应行前面的注释符号(`#`)即可（不了解时建议只选择带有`UTF-8`的项）：

    ```bash
    # vim /etc/locale.gen
    -----------------------------------------------------------------------------
    en_US.UTF-8 UTF-8
    zh_CN.UTF-8 UTF-8
    zh_CN.GBK GBK
    zh_TW.UTF-8 UTF-8
    zh_HK.UTF-8 UTF-8
    ```

    接着执行`locale-gen`以生成locale讯息：

    ```bash
    # locale-gen
    ```

    该命令会根据`/etc/locale.gen`生成指定的本地化文件

2. `/etc/locale.conf`

    手动创建`/etc/locale.conf`文件并在其中设置`LANG`变量：

    ```bash
    # vim /etc/locale.conf
    -----------------------------------------------------------------------------
    LANG=en_US.UTF-8
    ```

    > 将环境变量`LANG`设置为'en_US.UTF-8'，系统的log就会用英文显示，这样更容易在系统出现问题时进行诊断，当然也可以根据自己的实际情况设置
    >
    > 不推荐在此设置任何中文locale,会导致TTY乱码

### 3.5 网络

1. 创建hostname文件

    ```bash
    # vim /etc/hostname
    -----------------------------------------------------------------------------
    myhostname
    ```

    > 将'myhostname'替换为自己实际的hostname

2. 添加对应的信息到hosts

    ```bash
    # vim /etc/hosts
    -----------------------------------------------------------------------------
    127.0.0.1   localhost
    ::1         localhost
    127.0.1.1   myhostname.localdomain     myhostname
    ```

    > 如果有一个永久的IP地址，请使用这个IP替换`127.0.1.1`
    >
    > 对于新安装的系统，需要再次[设置网络](https://wiki.archlinux.org/index.php/Network_configuration_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))，因此要安装想要使用的[网络管理器软件](https://wiki.archlinux.org/index.php/Network_management)

### 3.6 Initramfs

通常不需要创建initramfs，因为在执行`pacstrap`时已经安装`linux`，这时[mkinitcpio](https://wiki.archlinux.org/index.php/Mkinitcpio)会自动运行

对于[LVM](https://wiki.archlinux.org/index.php/LVM#Configure_mkinitcpio)、[system encryption](https://wiki.archlinux.org/index.php/Dm-crypt)或[RAID](https://wiki.archlinux.org/index.php/RAID#Configure_mkinitcpio)，修改[mkinitcpio.conf](https://wiki.archlinux.org/index.php/Mkinitcpio_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))后执行以下命令新建一个Initramfs：

```bash
# mkinitcpio -P
```

### 3.7 Root密码

设置root帐户密码：

```bash
# passwd
```

### 3.8 a安装引导程序

以上步骤完成之后，需要安装一个Linux引导程序以便在安装完成后启动系统，可以使用的引导程序在[启动加载器](https://wiki.archlinux.org/index.php/Boot_loaders_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))中，选择其中一个

## 4 重启

之后，执行`exit`命令或按`Ctrl+d`退出chroot环境

1. 解除挂载

    可以直接执行`umount -R /mnt`命令手动卸载分区，这有助于发现“繁忙(busy)”的分区，并通过[fuser(1)](https://jlk.fjfi.cvut.cz/arch/manpages/man/fuser.1)查找原因

2. 重启系统

    执行`reboot`命令重启系统，`systemd`将自动卸载任何仍然挂载的分区

最后，在关机完成后**移除安装介质**，然后使用root帐户登陆到新系统

## 5 用户和组

### 5.1 添加登录用户

日常使用root用户登录有很大的安全隐患，因此建议添加一个普通权限的登录用户

比如要添加一个名为'yj'的用户，并使用zsh作为登陆shell：

```bash
# useradd -m -G wheel -s /usr/bin/zsh yj
```

### 5.2 将用户添加到组

将指定用户添加到指定的组，比如将用户'yj'添加到'docker'组：

```bash
# usermod -aG docker,input yj
```

> 可以一次奖指定用户添加到多个组，只需要用逗号间隔组名
>
> 如果不使用`-a`选项，用户'yj'就会离开'docker'和'input'之外的其他组

## 6 之后的工作

系统管理引导，图形用户界面的安装、声音管理、触摸板支持等后期工作参见[General recommendations](https://wiki.archlinux.org/index.php/General_recommendations_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87))

