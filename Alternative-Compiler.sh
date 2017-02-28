#!/bin/bash
. ./CommonLibrary.lib

set-title 'Downloading the compiler binaries'

TARNAME=swift-DEVELOPMENT-SNAPSHOT-2017-02-24-a-ubuntu16.04

curl -o ./$TARNAME.tar.gz 'https://swift.org/builds/development/ubuntu1604/swift-DEVELOPMENT-SNAPSHOT-2017-02-24-a/swift-DEVELOPMENT-SNAPSHOT-2017-02-24-a-ubuntu16.04.tar.gz'

tar -xzf $TARNAME.tar.gz
cd $TARNAME

cp ./usr 

#./configure
#make
#sudo make install

sudo cp -R ./usr/* /usr



