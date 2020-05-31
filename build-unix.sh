#!/bin/bash

echo "Qt Version: $QT5_VERSION"
echo "Qt Install Prefix: $QT5_INSTALL_PREFIX"
echo "Travis build dir: $TRAVIS_BUILD_DIR"
echo "Travos OS name: $TRAVIS_OS_NAME"

../qt5/qtbase/configure -opensource -confirm-license -prefix "$QT5_INSTALL_PREFIX" -static -release -ltcg -optimize-size -no-pch -sql-sqlite -qt-zlib -qt-libjpeg -qt-libpng -qt-pcre -qt-harfbuzz -skip webengine -nomake tools -nomake tests -nomake examples
  # - ../qt5/qtbase/configure -opensource -confirm-license -prefix $QT5_INSTALL_PREFIX -release -static -silent -sql-sqlite -qt-zlib -qt-libjpeg -qt-libpng -qt-pcre -qt-harfbuzz -no-compile-examples -nomake tests -nomake examples -no-opengl -no-openssl -no-sql-odbc -no-icu -no-feature-concurrent -no-feature-xml -feature-testlib
make -j2
sudo make install
"$QT5_INSTALL_PREFIX/bin/qmake" -v