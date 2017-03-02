#!/bin/bash
. ./CommonLibrary.lib

set-title '(1 / 2) Testing docker privileges'

echo 'Now we will test if you have the rights to run docker without root privileges'

docker run hello-world > /dev/null

# If text
OK='Docker rights acquired successfully'
FAIL='Docker rights were not acquired. Terminating'

if [ $? -eq 0 ]; then
    echo $OK
else
    echo $FAIL
    exit 1
fi

set-title '(2 / 2) Downloading and Testing Source Kite image'

docker pull jinmingjian/docker-sourcekite

echo 'We will test now if the sourcekite image works.'

echo ''

echo 'Press Ctrl+D to continue the test if the terminal does not do so right away.'

docker run --rm -i jinmingjian/docker-sourcekite > /dev/null

# If text
OK='The Source Kite image passed the test. You can now install and use SDE.'
FAIL='The Source Kite image does not appear to be working correctly. Terminating'

if [ $? -eq 0 ]; then
    echo $OK
else
    echo $FAIL
    exit 1
fi

