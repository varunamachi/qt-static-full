#!/bin/bash



  mkdir build
  cd build || exit 100
  # - ..\qt5\qtbase\configure -opensource -confirm-license -platform win32-g++ -prefix %QT5_INSTALL_PREFIX% -release -static -static-runtime -silent -sql-sqlite -qt-zlib -qt-libjpeg -qt-libpng -qt-pcre -qt-harfbuzz
  ../qt5/qtbase/configure -release -static -static-runtime -no-pch -opengl desktop -platform win32-g++ -prefix "%QT5_INSTALL_PREFIX%" -silent -sql-sqlite -qt-zlib -qt-libjpeg -qt-libpng -qt-pcre -qt-harfbuzz -skip webengine -nomake tools -nomake tests -nomake examples
  mingw32-make -j2 || 
  mingw32-make install
  dir
  "$QT5_INSTALL_PREFIX\bin\qmake -v"