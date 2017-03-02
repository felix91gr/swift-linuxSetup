#!/bin/bash
. ./CommonLibrary.lib

set-title '(1 / 1) Installing basic dependencies for Swift' 

sudo apt-get install -y curl git cmake ninja-build clang python uuid-dev libicu-dev icu-devtools libbsd-dev libedit-dev libxml2-dev libsqlite3-dev swig libpython-dev libncurses5-dev pkg-config libblocksruntime-dev libcurl4-openssl-dev autoconf libtool systemtap-sdt-dev

OK='Basic dependencies successfully installed'
FAIL='Basic dependencies installation failed'

if [ $? -eq 0 ]; then
    echo $OK
else
    echo $FAIL
    exit 1
fi

