#!/bin/bash
. ./CommonLibrary.lib

set-title '(0 / 3) Setting up global variables'

CURRENT_PATH=$(pwd -L)
#TAG=2017-03-24-a

# We fetch the latest 3.1 tag from the Swift repositories.
TAG=\
    $(curl --silent https://github.com/apple/swift/releases \
    | grep -m 1 -o 'swift-3\.1-DEVELOPMENT-SNAPSHOT-2017-[0-9][0-9]-[0-9][0-9]-a') \
    | grep -o '2017-[0-9][0-9]-[0-9][0-9]-a'

set-title '(1 / 3) Cloning Swift repositories' 

OK='Swift repos successfully cloned'
FAIL='Swift repos cloning failed'

echo "Clone swift repositories?"
select yn in "Yes" "No"; do
    case $yn in
        Yes )
			rm -rf \
                build clang cmark compiler-rt llbuild \
                lldb llvm ninja swift \
                swift-corelibs-foundation swift-corelibs-libdispatch \
                swift-corelibs-xctest swift-integration-tests \
                swiftpm swift-xcode-playground-support
            git clone https://github.com/apple/swift
            swift/utils/update-checkout --clone --tag 'swift-3.1-DEVELOPMENT-SNAPSHOT-'$TAG
            if [ $? -eq 0 ]; then
                notify-me $OK                
                notify-send --app-name=Terminal 'Step 1 finished'  $OK
            else
                notify-me $FAIL
                notify-send --app-name=Terminal 'Step 1 finished'  $FAIL
                exit 1
            fi
            break
            ;;
        No ) 
            echo 'Not cloning then.' 
            break            
            ;;
    esac
done

set-title '(2 / 3) Cherry-picking relevant commits from master and Norio Nomura.s fork' 

OK='Cherry-picking was successful'
FAIL='Cherry-picking failed'

echo "Do you wish to cherry pick the relevant commits?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            cd $CURRENT_PATH'/swift'
            git cherry-pick --strategy=recursive -X theirs 3e9f66c
            git cherry-pick --strategy=recursive -X theirs 1673b5e 
            git fetch origin pull/8189/head:pr-8189
            git cherry-pick --strategy=recursive -X theirs 856e4e4
            if [ $? -eq 0 ]; then
                notify-me $OK
                notify-send --app-name=Terminal 'Step 2 finished' $OK
            else
                notify-me $FAIL
                notify-send --app-name=Terminal 'Step 2 finished' $FAIL
                exit 1
            fi
            break
            ;;
        No ) 
            echo 'Not cherry-picking then.'
            break
            ;;
    esac
done

set-title '(3 / 3) Building everything in one-pass' 

OK='Building process was successful'
FAIL='Building process failed'

cd $CURRENT_PATH

TIME=$(date +"%F-%Hh")
#echo 'Current time: '$TIME'

echo "Do you wish to build the toolchain and sourcekit?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) 
            swift/utils/build-script \
              --preset="buildbot_linux,smoketest" \
              -- \
              install_destdir="${pwd}/build/swift-3.1-DEVELOPMENT-SNAPSHOT-${TAG}" \
              installable_package="${pwd}/build/swift-3.1-DEVELOPMENT-SNAPSHOT-${TAG}.tar.gz" | tee "./buildLog@${TIME}.txt"
            if [ $? -eq 0 ]; then
                notify-me $OK
                notify-send --app-name=Terminal 'Step 3 finished' $OK
            else
                notify-me $FAIL
                notify-send --app-name=Terminal 'Step 3 finished' $FAIL
                exit 1
            fi
            break
            ;;
        No ) 
            echo 'Not building then.'
            break
            ;;
    esac
done


# Chequear el output de ldd (sourcekit). Si no encuentra a libdispatch.so, entonces hay que agregar su carpeta al directorio de librerías
sudo echo >> ~/.bashrc
sudo echo export LD_LIBRARY_PATH=/build/swift-3.1-DEVELOPMENT-SNAPSHOT-${TAG}/usr/lib/swift/linux/:${LD_LIBRARY_PATH} >> ~/.bashrc

# Chequear que no esté swift 3.1 instalado
sudo echo >> ~/.bashrc
sudo echo export PATH=/build/swift-3.1-DEVELOPMENT-SNAPSHOT-${TAG}/usr/bin/:${PATH} >> ~/.bashrc	
