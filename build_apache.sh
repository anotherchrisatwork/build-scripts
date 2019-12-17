#!/usr/bin/env bash
set -e
echo "Rebuilding the world."
cd ~/build
if [ `/bin/ls | wc -l` != 0 ] ; then
  rm -rf `/bin/ls`
fi

echo "Untar'ing pcre"
bzip2 -d < ../Downloads/pcre-8.43.tar.bz2 | tar xf -
pushd ./pcre*
echo "Configuring pcre"
./configure --prefix=/home/chris/install/pcre
echo "Building pcre"
make -j 3
make install
popd

echo "Untar'ing expat"
bzip2 -d < ../Downloads/expat-2.2.9.tar.bz2 | tar xf -
pushd ./expat*
echo "Configuring expat"
./configure --prefix=/home/chris/install/expat
echo "Building expat"
make -j 3
make install
popd

echo "Untar'ing apache httpd"
bzip2 -d < ../Downloads/httpd-2.4.41.tar.bz2 | tar xf -
pushd ./httpd*

echo "Setting up apr and apr-util"
cd srclib
bzip2 -d < ~/Downloads/apr-1.7.0.tar.bz2 | tar xf -
bzip2 -d < ~/Downloads/apr-util-1.6.1.tar.bz2 | tar xf -
mv apr-1.7.0 apr
mv apr-util-1.6.1 apr-util
cd ..

echo "Configuring httpd"
./configure --prefix=/home/chris/install/httpd \
  --with-pcre=/home/chris/install/pcre \
  --with-expat=/home/chris/install/expat
echo "Building httpd"
make -j 3
make install
popd
