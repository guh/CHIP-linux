#!/bin/bash -e

export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
export KBUILD_DEBARCH=armhf
export KDEB_CHANGELOG_DIST=jessie
export LOCALVERSION=-loop-mlc
export KDEB_PKGVERSION=$(make kernelversion)-${LOOPKERNELVERSION}
export DEBFULLNAME="guh GmbH"
export DEBEMAIL="developers@guh.io"

make loop_defconfig

make menuconfig

make -j9 prepare modules_prepare scripts
make -j9 deb-pkg

exit 0
