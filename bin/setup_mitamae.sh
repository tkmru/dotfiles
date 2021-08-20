#!/bin/sh
set -eu

version='1.12.7'
mitamae_version="mitamae-${version}"

if ! [ -f "bin/${mitamae_version}" ]; then
  if [ $(uname) = 'Darwin' ]; then
    suffix="darwin"
  else
    suffix="linux"
  fi

  if [ $(uname -m) = 'x86_64' ]; then
    arch="x86_64"
  else
    arch="aarch64"
  fi

  mitamae_bin=mitamae-$arch-$suffix

  # http://www.hcn.zaq.ne.jp/___/unix/curl_manual.html
  curl -o "bin/${mitamae_bin}.tar.gz" -fL "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${mitamae_bin}.tar.gz"
  tar xvzf "bin/${mitamae_bin}.tar.gz"

  rm "bin/${mitamae_bin}.tar.gz"
  mv "${mitamae_bin}" "bin/${mitamae_version}"
  chmod +x "bin/${mitamae_version}"
  ln -sf "${mitamae_version}" bin/mitamae

else
  echo 'already installed Mitamae'
fi
