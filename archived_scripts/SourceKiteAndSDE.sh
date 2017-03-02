#!/bin/bash
. ./CommonLibrary.lib

set-title '(1 / ) Cloning the Source Kite repository...'

git clone https://github.com/jinmingjian/sourcekite.git
cd sourcekite/

pause 'Compile Source Kite? Press Ctrl+C to cancel, ENTER to continue'

set-title '(2 / ) Compiling Source Kite...'

sudo ln -sf /usr/lib/sourcekitdInProc.framework/sourcekitdInProc /usr/lib/sourcekitdInProc
swift build -Xlinker -l:sourcekitdInProc

pause 'Install VSCode? Press Ctrl+C to cancel, ENTER to continue'

set-title '(3 / ) Installing VSCode'

# Prereq: curl
sudo apt install curl

# Install key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
# Install repo
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# Update apt-get
sudo apt-get update
# Install
sudo apt-get install code

set-title '(4 / ) Installing SDE for VSCode'

echo 'Install SDE as it-s shown in the README:'
echo https://github.com/jinmingjian/sde

