#!/usr/bin/env sh
deps="
bat
build-base
coreutils
curl
exa
git
htop
neofetch
neovim
neovim-doc
nodejs
npm
openssh
openssl
parallel
ripgrep
shadow
tmux
wget
zsh
python3
py3-pip
"
deps=$(printf "$deps" | tr '\n' ' ' | sed -e 's/^[[:space:]]*//')

apk add --no-cache $deps
