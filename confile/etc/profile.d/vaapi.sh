: <<!
File: vaapi.sh
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2020-04-03 14:26:31

Description: 配置视频解码硬件加速

安装libva-intel-driver则设为i965
安装intel-media-driver则设为iHD
!

dir="/usr/lib/dri"

if [[ -x $dir/i965_drv_video.so ]]; then
  export LIBVA_DRIVER_NAME=i965
elif [[ -x $dir/iHD_drv_video.so ]]; then
  export LIBVA_DRIVER_NAME=iHD
fi
