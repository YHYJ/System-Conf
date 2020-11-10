:<<!
Author: YJ
Email: yj1516268@outlook.com
Created Time: 2019-07-12 10:03:25

Description: 配置rust环境
!

cargo_path="$HOME/.cargo"

if [[ -d $cargo_path ]]; then
  export CARGOPATH="$cargo_path"
  export PATH="$PATH:$CARGOPATH/bin"
  export RUSTUP_DIST_SERVER="https://mirrors.ustc.edu.cn/rust-static"
  export RUSTUP_UPDATE_ROOT="https://mirrors.ustc.edu.cn/rust-static/rustup"

  rust_src_path="$(rustc --print sysroot)/lib/rustlib/src/rust/src"

  if [[ -d $rust_src_path ]]; then
    export RUST_SRC_PATH="$rust_src_path"
  fi
fi
