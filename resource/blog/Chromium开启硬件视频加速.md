# Chromium开启硬件视频加速

VA-API支持

---

## Table of Contents

<!-- vim-markdown-toc GFM -->

* [启用硬件视频加速](#启用硬件视频加速)
    * [安装驱动](#安装驱动)
    * [验证VA-API](#验证va-api)
    * [配置VA-API](#配置va-api)
* [配置Chromium](#配置chromium)
    * [强制GPU加速](#强制gpu加速)
    * [Chromium的VA-API支持](#chromium的va-api支持)
* [解码方式验证](#解码方式验证)
* [参考连接：](#参考连接)

<!-- vim-markdown-toc -->

---

有3种在Linux上实现硬件视频加速的方法：

- [视频加速API](https://www.freedesktop.org/wiki/Software/vaapi/)(VA-API)由Intel开发，用于提供硬件加速的视频编/解码
- [Unix视频解码和演示API](https://www.freedesktop.org/wiki/Software/VDPAU/)(VDPAU)用于将部分视频解码和处理工作移交到NVIDIA显卡
- [NVDECODE/NVENCODE](https://developer.nvidia.com/nvidia-video-codec-sdk)是NVIDIA Fermi, Kepler, Maxwell和Pascal系列显卡专用的硬件视频加速API

这里只对VA-API进行说明，其他方法请见给出的链接的其他部分内容

Arch Linux官方打包的Chromium不支持VA-API，首要条件就是安装社区打包的chromium-vaapi

---

## 启用硬件视频加速

启用硬解码可以使显卡对视频进行编/解码，从而减轻CPU负担并省电

### 安装驱动

Intel显卡开源驱动支持VA-API：

第六代及更新酷睿需要[linux-firmware](https://www.archlinux.org/packages/?name=linux-firmware)

- [intel-media-driver](https://www.archlinux.org/packages/?name=intel-media-driver)支持第五代(Broadwell)及更新代酷睿的HD Graphics系列显卡
- [libva-intel-driver](https://www.archlinux.org/packages/?name=libva-intel-driver)支持GMA 4500系列和最高第八代(Coffee Lake)酷睿的较新显卡
- [libva-intel-driver-g45-h264(AUR)](https://aur.archlinux.org/packages/libva-intel-driver-g45-h264/)支持GMA 4500 H.264解码，参阅[Intel#Hardware accelerated H.264 decoding on GMA 4500](https://wiki.archlinux.org/index.php/Intel#Hardware_accelerated_H.264_decoding_on_GMA_4500)
- [intel-hybrid-codec-driver(AUR)](https://aur.archlinux.org/packages/intel-hybrid-codec-driver/)支持第五代至第六代酷睿的VP9解码和第四代至第六代酷睿的混合VP8编码

### 验证VA-API

运行`vainfo`命令来验证VA-API的设置，该命令由[libva-utils](https://www.archlinux.org/packages/?name=libva-utils)提供：

```bash
$ vainfo

vainfo: VA-API version: 1.7 (libva 2.6.0)
vainfo: Driver version: Intel iHD driver - 19.4.0
vainfo: Supported profile and entrypoints
      VAProfileNone                   :	VAEntrypointVideoProc
      VAProfileNone                   :	VAEntrypointStats
      VAProfileMPEG2Simple            :	VAEntrypointVLD
      VAProfileMPEG2Simple            :	VAEntrypointEncSlice
      VAProfileMPEG2Main              :	VAEntrypointVLD
      VAProfileMPEG2Main              :	VAEntrypointEncSlice
      VAProfileH264Main               :	VAEntrypointVLD
      VAProfileH264Main               :	VAEntrypointEncSlice
      VAProfileH264Main               :	VAEntrypointFEI
      VAProfileH264Main               :	VAEntrypointEncSliceLP
      VAProfileH264High               :	VAEntrypointVLD
      VAProfileH264High               :	VAEntrypointEncSlice
      VAProfileH264High               :	VAEntrypointFEI
      VAProfileH264High               :	VAEntrypointEncSliceLP
      VAProfileVC1Simple              :	VAEntrypointVLD
      VAProfileVC1Main                :	VAEntrypointVLD
      VAProfileVC1Advanced            :	VAEntrypointVLD
      VAProfileJPEGBaseline           :	VAEntrypointVLD
      VAProfileJPEGBaseline           :	VAEntrypointEncPicture
      VAProfileH264ConstrainedBaseline:	VAEntrypointVLD
      VAProfileH264ConstrainedBaseline:	VAEntrypointEncSlice
      VAProfileH264ConstrainedBaseline:	VAEntrypointFEI
      VAProfileH264ConstrainedBaseline:	VAEntrypointEncSliceLP
      VAProfileVP8Version0_3          :	VAEntrypointVLD
      VAProfileVP8Version0_3          :	VAEntrypointEncSlice
      VAProfileHEVCMain               :	VAEntrypointVLD
      VAProfileHEVCMain               :	VAEntrypointEncSlice
      VAProfileHEVCMain               :	VAEntrypointFEI
      VAProfileHEVCMain10             :	VAEntrypointVLD
      VAProfileHEVCMain10             :	VAEntrypointEncSlice
      VAProfileVP9Profile0            :	VAEntrypointVLD
      VAProfileVP9Profile2            :	VAEntrypointVLD
```

`VAEntrypointVLD`表示显卡能够解码该格式，`VAEntrypointEncSlice`表示显卡能够编码该格式

该示例使用'iHD'驱动，见以下行：

```bash
vainfo: Driver version: Intel iHD driver - 19.4.0
```

如果运行`vainfo`出现以下报错，需要设置环境变量`LIBVA_DRIVER_NAME`，参阅[配置VA-API](#配置va-api)

### 配置VA-API

`LIBVA_DRIVER_NAME`变量指定了使用哪个驱动程序：

- 安装[intel-media-driver](https://www.archlinux.org/packages/?name=intel-media-driver)则变量值为'iHD'
- 安装[libva-intel-driver](https://www.archlinux.org/packages/?name=libva-intel-driver)则变量值为'i965'

> 在`/usr/lib/dri`中可以找到已安装的驱动程序，驱动程序文件名为'${LIBVA_DRIVER_NAME}_drv_video.so'
>
> 出于兼容性考虑，某些驱动程序以不同名称多次安装，可以运行`sha1sum /usr/lib/dri/* | sort`进行分辨

## 配置Chromium

### 强制GPU加速

**警告：强制GPU加速可能会导致不稳定性为，包括系统崩溃，具体参见`chrome://gpu`中的错误报告**

Chromium在Linux上不启用任何GPU加速，要强制使用GPU加速，将以下配置添加到Chromium配置文件：

```bash
--ignore-gpu-blacklist
--enable-gpu-rasterization
--enable-native-gpu-memory-buffers
--enable-zero-copy
```

`chrome://gpu`中'Video Decode'字段的值应当是'Hardware accelerated'，否则可能还需要在配置文件中添加`--disable-gpu-driver-bug-workarounds`

Chromium配置文件是`~/.config/chromium-flags.conf`，该文件可能需要手动创建

### Chromium的VA-API支持

**注意：Wayland不受支持，XWayland在[libva-intel-driver](https://www.archlinux.org/packages/?name=libva-intel-driver)上是损坏的**

开启Chromium的VA-API支持，需要确保：

- 已经安装了正确的VA-API驱动程序，并且验证了VA-API已开启且正常工作，请参阅[启用硬件视频加速](#启用硬件视频加速)
- 安装chromium-vaapi，可以从AUR或archliunxcn源或其他存储库获取
- Chromium默认使用了GPU blacklist，需要[强制GPU加速](#强制gpu加速)
- 检查`chrome://gpu`的'Video Decode'字段的值为'Hardware accelerated'

## 解码方式验证

要验证Chromium当前使用的解码方式，需要以下步骤：

1. 打开`chrome://gpu`并确保'Video Decode'字段的值为'Hardware accelerated'，如下图：

    ![gpu](https://gitee.com/YJ1516/MyPic/raw/master/picgo/gpu.png)

2. 播放一个视频
3. 在新标签中打开`chrome://media-internals`并点击如下图"1"处，在显示的信息中找到类似**'video_decoder'**的字段，如图中"2"处的'kVideoDecoderName'

    ![media internals](https://gitee.com/YJ1516/MyPic/raw/master/picgo/media-internals.png)

4. 根据**'video_decoder'**的值确定使用的解码方式：

    - 硬件加速：MojoVideoDecoder, GpuVideoDecoder
    - 软件解码：VpxVideoDecoder, FFmpegVideoDecoder

要在观看无法使用VP8/VP9硬件解码的YouTube视频时减少CPU使用率，使用[h264ify](https://chrome.google.com/webstore/detail/h264ify/aleakchihdccplidncghkekgioiakgal)或[Enhanced-h264ify](https://chrome.google.com/webstore/detail/enhanced-h264ify/omkfmpieigblcllmkgbflkikinpkodlk)

## 参考连接：

- [Hardware_video_acceleration](https://wiki.archlinux.org/index.php/Hardware_video_acceleration)
- [Chromium#Hardware_video_acceleration#Hardware_video_acceleration](https://wiki.archlinux.org/index.php/Chromium#Hardware_video_acceleration)
- [chromium: hardware video acceleration with VA-API](https://bbs.archlinux.org/viewtopic.php?id=244031)
