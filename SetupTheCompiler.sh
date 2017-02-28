#!/bin/bash
. ./CommonLibrary.lib

set-title '(1 / 5) Setting up Linux presets (creds to Jin Ming Jian)'

git clone https://github.com/jinmingjian/swift-linux-build.git
sudo cp swift-linux-build/.swift-build-presets ~/

if [ $? -eq 0 ]; then
    echo 'Presets sat up successfully'
else
    echo 'Failed to set up presets'
    exit 1
fi

set-title '(2 / 5) Creating directory for the Swift Compiler' 

mkdir swift-source
cd swift-source

set-title '(3 / 5) Cloning relevant repositories'

git clone --verbose --branch swift-DEVELOPMENT-SNAPSHOT-2017-02-24-a https://github.com/apple/swift.git
./swift/utils/update-checkout --clone

set-title '(4 / 5) Building the compiler'

sudo swift/utils/build-script --preset=jin

if [ $? -eq 0 ]; then
    echo 'Compiler built successfully'
else
    echo 'Failed to build compiler. Installation will stop here.'
    exit 1
fi

pause 'Compiler built. Next step: making symlinks. Press [ENTER] to continue.'

set-title '(5 / 5) Making symbolic links'

# For some reason, this didn't quite work.
# export PATH=/jin/linux/swift-git/output/usr/bin:"${PATH}"

# Home folder of binaries
OUTPUTUSR=/jin/linux/swift-git/output/usr/
cd OUTPUTUSR

# We create the directories for the symbolic links
find -type d -printf '%P\n' | while read directory; do 
    #echo Creating "$directory" inside of /usr/
    sudo mkdir /usr/$directory
done

# And then we create the necessary symbolic links
find -type f -printf '%P\n'| while read binary; do 
    #echo Original: "$OUTPUTUSR$binary"
    #echo Will be linked by: /usr/$binary
    sudo ln -sf $OUTPUTUSR$binary /usr/$binary -v
done
