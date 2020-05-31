#!/bin/bash

echo "Qt Version: $QT5_VERSION"
echo "Qt Install Prefix: $WINDOWS_QT5_INSTALL_PREFIX"
echo "Travis build dir: $TRAVIS_BUILD_DIR"
echo "Travos OS name: $TRAVIS_OS_NAME"

  mkdir build
  cd build || exit 100
  # - ..\qt5\qtbase\configure -opensource -confirm-license -platform win32-g++ -prefix %QT5_INSTALL_PREFIX% -release -static -static-runtime -silent -sql-sqlite -qt-zlib -qt-libjpeg -qt-libpng -qt-pcre -qt-harfbuzz
  ../qt5/qtbase/configure -release -static -static-runtime -no-pch -opengl desktop -platform win32-g++ -prefix "$WINDOWS_QT5_INSTALL_PREFIX" -silent -sql-sqlite -qt-zlib -qt-libjpeg -qt-libpng -qt-pcre -qt-harfbuzz -skip webengine -nomake tools -nomake tests -nomake examples
  mingw32-make -j2 || 
  mingw32-make install
  dir
  "$QT5_INSTALL_PREFIX/bin/qmake -v"