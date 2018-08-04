#!/bin/bash

export CXX=$COMPILER

mkdir build
cd build

if [[ $BUILD_TARGET == 'android' ]]; then
#***************#
# Android build #
#***************#
  sh ../scripts/build_android.sh
elif [[ $BUILD_TARGET == 'ios' ]]; then
#***************#
# iOS build     #
#***************#
  sh ../scripts/build_ios.sh
elif [[ $TRAVIS_OS_NAME == 'osx' ]]; then
#************#
# OS X build #
#************#
  cmake .. -DCMAKE_VERBOSE_MAKEFILE=ON -DUSE_OPENCV=off && make
else
#*************#
# Linux build #
#*************#
  cmake .. -DCMAKE_VERBOSE_MAKEFILE=ON && make
fi
# test travis
