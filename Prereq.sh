#!/bin/bash
. ./CommonLibrary.lib

OK='Prerequisites successfully installed'
FAIL='Prerequisites installation failed'

set-title '(1 / 1) Installing prerequisites for Swift' 

sudo apt-get install git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev autoconf libtool systemtap-sdt-dev

#pause 'Press ENTER to continue'

if [ $? -eq 0 ]; then
    echo $OK
else
    echo $FAIL
    exit 1
fi

