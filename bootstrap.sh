#!/usr/bin/env bash

su ubuntu <<EOSU
cd /home/ubuntu
export SH=/bin/bash
whoami
pwd
git clone --depth 1 https://github.com/jsonn/pkgsrc.git
cd ~/pkgsrc/bootstrap
pwd
./bootstrap --unprivileged
ls -lah ~/pkg/
cd ~/pkgsrc/pkgtools/pkg_install && ~/pkg/bin/bmake install clean clean-depends
cd ~/pkgsrc/pkgtools/pkg_rolling-replace && ~/pkg/bin/bmake install clean clean-depends
cd ~/pkgsrc/pkgtools/pkg_chk && ~/pkg/bin/bmake install clean clean-depends
EOSU
