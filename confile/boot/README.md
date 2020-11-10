# README

启动目录(`/boot`)下需要备份的文件

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [boot](#boot)

<!-- vim-markdown-toc -->

---

---

## boot

启动加载器systemd-boot配置文件

> ./loader/loader.conf --> /boot/loader/loader.conf
>
> ./loader/entries/arch.conf --> /boot/loader/entries/arch.conf
>
> > 其中`root=PARTUUID=XXXX`中的'XXXX'可以根据命令
> >
> > ```base
> >    ls -l /dev/disk/by-partuuid
> > ```
> >
> > 的输出结果找到其中的根分区(/)对应的PARTUUID的值来填写

