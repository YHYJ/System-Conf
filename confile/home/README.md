# README

主目录(`$HOME`)下需要备份的文件

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [bashrc](#bashrc)
* [cargo](#cargo)
* [dot_local](#dot_local)
* [dot_config](#dot_config)
* [dtags](#dtags)
* [libinput](#libinput)
    * [libinput-gestures.conf](#libinput-gesturesconf)
    * [libinput-gestures.service](#libinput-gesturesservice)
* [npm](#npm)
* [vim](#vim)
* [xprofile](#xprofile)
* [pam_environment](#pam_environment)
* [zsh](#zsh)
    * [zsh配置文件](#zsh配置文件)
    * [zsh主题(theme)配置文件](#zsh主题theme配置文件)
* [Templates](#templates)
* [files](#files)

<!-- vim-markdown-toc -->

---

---

## bashrc

bash配置文件

> ./bashrc/bashrc --> "$HOME"/.bashrc

## cargo

cargo源配置文件

> ./cargo/config --> "$HOME"/.cargo/config

## dot_local

.config中的本地共享文件

> ./dot_local --> "$HOME"/.local

## dot_config

.config中的配置文件

> ./dot_config --> "$HOME"/.config

## dtags

路径标签dtags

> ./dtags/* --> "$HOME"/.dtags/

## libinput

触摸板手势

- 在i3wm中无法自启，暂时抛弃

### libinput-gestures.conf

触摸板手势配置文件

> ./libinput/libinput-gestures.conf --> "$HOME"/.config/libinput-gestures.conf

### libinput-gestures.service

触摸板手势服务文件，使用`--user`参数管理

> ./libinput/libinput-gestures.service --> /etc/systemd/user/libinput-gestures.service

## npm

npm配置文件

> ./npm/.npmrc --> "$HOME"/.npmrc

## vim

vim & space-vim配置文件

> ./vim/config.vim --> "$HOME"/.space-vim/private/config.vim
>
> ./vim/packages.vim --> "$HOME"/.space-vim/private/packages.vim
>
> ./vim/spacevim --> "$HOME"/.spacevim

## xprofile

启动X会话的时候的动作

> ./xprofile/xprofile --> "$HOME"/.xprofile

## pam_environment

动态认证变量

> ./pam_environment/pam_environment --> "$HOME"/.pam_environment

## zsh

### zsh配置文件

> ./zsh/zshrc --> "$HOME"/.zshrc
> ./zsh/zshenv --> "$HOME"/.zshenv

### zsh主题(theme)配置文件

> ./zsh/themes/p10k.zsh --> "$HOME"/.p10k.zsh

## Templates

模板文件

> ./Templates --> "$HOME"/.Templates

## files

非配置文件的备份

> ./files/LocalBackups --> "$HOME"/Documents/LocalBackups
>
> ./files/Pictures --> "$HOME"/Pictures

