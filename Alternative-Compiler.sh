#!/bin/bash
. ./CommonLibrary.lib

set-title '(1 / 1) Downloading the compiler binaries'

SNAP=swift-DEVELOPMENT-SNAPSHOT-2017-02-24-a
END=-ubuntu16.04
TARNAME=$SNAP$END

curl -o ./$TARNAME.tar.gz 'https://swift.org/builds/development/ubuntu1604/'$SNAP/$TARNAME'.tar.gz'

tar -xzf $TARNAME.tar.gz

FOLDERNAME=swift-binaries

rm -rf ./$FOLDERNAME
mv ./$TARNAME ./$FOLDERNAME

rm -rf $TARNAME.tar.gz

PATHTOSWIFT=$(pwd)/$FOLDERNAME/usr/bin

echo Path to Swift: $PATHTOSWIFT

hash swift 2>/dev/null || { 
  echo 'Could not find Swift Toolkit. Setting it in PATH...'
  echo PATH=$PATH:$PATHTOSWIFT >> ~/.bashrc
  echo export PATH >> ~/.bashrc
}

echo 'Now setting up links to the libraries'

PATHTOLIBS=$(pwd)/$FOLDERNAME/usr/lib/swift/linux

sudo rm /etc/ld.so.conf.d/swift123.conf
echo $PATHTOLIBS
echo $PATHTOLIBS | sudo tee -a /etc/ld.so.conf.d/swift123.conf
