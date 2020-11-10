# 系统优化

Arch Linux

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [SSD](#ssd)
    * [TRIM](#trim)
    * [性能最大化](#性能最大化)
        * [NVMe](#nvme)
        * [SATA](#sata)
    * [最小化硬盘读写](#最小化硬盘读写)
        * [Fatab](#fatab)
        * [将频繁使用的文件置于内存](#将频繁使用的文件置于内存)
        * [在tmpfs里编译](#在tmpfs里编译)
    * [SSD固件升级](#ssd固件升级)
    * [恢复出厂默认的写入性能](#恢复出厂默认的写入性能)
* [NVMe](#nvme-1)
    * [NVMe电源管理](#nvme电源管理)

<!-- vim-markdown-toc -->

---

参考列表：

[Fstab](https://wiki.archlinux.org/index.php/Fstab)

[Solid state drive](https://wiki.archlinux.org/index.php/Solid_state_drive)

[Improving performance](https://wiki.archlinux.org/index.php/Improving_performance)

---

## SSD

### TRIM

**不建议在文件系统级别启用discard功能，而建议使用定期TRIM或者fstrim.timer**

1. 确定SSD是否支持[TRIM](https://en.wikipedia.org/wiki/TRIM)

    ```bash
    lsblk --discard
    ```

    检查输出结果的DISC-GRAN (discard granularity)和DISC-MAX (discard max bytes)列的值，非零值代表支持TRIM

2. 定时TRIM

    'util-linux'包提供了`fstrim.service`和`fstrim.timer`两个systemd单元文件，`fstrim.timer`每周激活一次，届时`fstrim.service`将会在支持TRIM的设备上的所有已挂载文件系统上执行[fstrim(8)](https://jlk.fjfi.cvut.cz/arch/manpages/man/fstrim.8)

    确保`fstrim.timer`在支持TRIM的设备上状态正常：

    ```bash
    systemctl status fstrim.timer
    ```

### 性能最大化

即使使用了大扇区（通常是4或8kB），大多数SSD仍然报告其扇区大小为512字节，这导致文件系统无法针对扇区大小进行优化，因此在创建文件系统时必须手动指定扇区大小

#### NVMe

要查看指定的NVMe设备是否支持该功能，执行以下命令：

```bash
nvme id-ns /dev/nvme0n1
```

输出示例如下：

```bash
nlbaf   : 0
[...]
lbaf  0 : ms:0   lbads:9  rp:0 (in use)
```

"nlbaf"的值是LBA formats数量减1，因此示例仅支持一种格式，输出的末尾是格式列表

"lbaf 0"表示LBA format #0，它的lbads(LBA data size)为9，这意味着扇区大小为29或512字节，如果该设备支持4kB扇区，则应该有另一个格式，其"lbads"为12

"rp"（相对性能）指示哪种format将提供最佳性能，其中0为最佳

要修改扇区大小，使用`nvme format --lbaf`命令，参数"--lbaf"指定首选项

#### SATA

SATA设备必须使用特定于制造商的程序，并非所有SATA设备都支持更改扇区大小

### 最小化硬盘读写

#### Fatab

确保`/etc/fstab`中<options>列参数使用'relatime'或'noatime'以减少或阻止从内存读取数据时产生的对磁盘的写入

#### 将频繁使用的文件置于内存

将浏览器配置文件通过tmpfs挂载到内存，并使用rsync同步基于硬盘的备份，这会减少磁盘损耗，加快浏览器速度

有自动完成该过程的软件[profile-sync-daemon](https://wiki.archlinux.org/index.php/profile-sync-daemon)

1. 安装

    ```bash
    pacman -S profile-sync-daemon
    ```

2. 编辑配置文件

    第一次运行psd会自动创建配置文件`$XDG_CONFIG_HOME/psd/psd.conf`，并且当psd处于活动状态时对此文件的所有改动都将在psd服务重新启动之后生效

    > TODO: 继续 <11-06-20, YJ> >

#### 在tmpfs里编译

详见[Makepkg](https://wiki.archlinux.org/index.php/Makepkg#Improving_compile_times)

> TODO: 完善 <11-06-20, YJ> >

### SSD固件升级

参见[Firmware](https://wiki.archlinux.org/index.php/Solid_state_drive#Firmware)

> TODO: 完善 <11-06-20, YJ> >

### 恢复出厂默认的写入性能

**这是一个危险操作，容易导致数据丢失**

[清除存储单元](https://wiki.archlinux.org/index.php/Solid_state_drive/Memory_cell_clearing)

## NVMe

### NVMe电源管理

执行以下命令：

```bash
nvme get-feature -f 0x0c -H /dev/nvme0
```

具体参见[NVMe](https://wiki.archlinux.org/index.php/Solid_state_drive/NVMe#Power_Saving_APST)
