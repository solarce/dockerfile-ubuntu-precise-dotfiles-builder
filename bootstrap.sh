#!/usr/bin/env bash

su ubuntu <<EOSU
cd /home/ubuntu
export SH=/bin/bash
git clone --depth 1 https://github.com/jsonn/pkgsrc.git
cd ~/pkgsrc/bootstrap
./bootstrap --unprivileged
cd ~/pkgsrc/pkgtools/pkg_rolling-replace && ~/pkg/bin/bmake install clean clean-depends
cd ~/pkgsrc/pkgtools/pkg_chk && ~/pkg/bin/bmake install clean clean-depends
EOSU
