#!/bin/bash -xv
#

cd $GITHUB_WORKSPACE
ls -l
mkdir -p workdir
cd workdir
ls -l
tar xzf ../qucs-0.0.19.tar.gz
cd qucs-qucs*
cp $GITHUB_WORKSPACE/good-qucs.desktop qucs/qucs/qucs.desktop # override destop file
# cp contrib/ubuntu-debian/qucs/debian/qucs.desktop qucs/qucs/qucs.desktop # don't work, cannot find the icon
mkdir build
cd build
cmake .. -DCMAKE_INSTALL_PREFIX=/usr
make install DESTDIR=AppDir
export LD_LIBRARY_PATH=$GITHUB_WORKSPACE/workdir/qucs-qucs-0.0.19/build/AppDir/usr/lib
$GITHUB_WORKSPACE/linuxdeploy-x86_64.AppImage --appdir AppDir --output appimage
ls -l
pwd
cp ./Qucs-*-x86_64.AppImage  $GITHUB_WORKSPACE/Qucs-0.0.19-x86_64.AppImage
mkdir -p $GITHUB_WORKSPACE/deploydir
cp ./Qucs-*-x86_64.AppImage  $GITHUB_WORKSPACE/deploydir/Qucs-0.0.19-x86_64.AppImage
cd $GITHUB_WORKSPACE
pwd
# ls -lR
