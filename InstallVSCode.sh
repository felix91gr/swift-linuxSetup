#!/bin/bash
. ./CommonLibrary.lib

set-title '(1 / 1) Installing VSCode'

# Install key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
# Install repo
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# Update apt-get
sudo apt-get update
# Install
sudo apt-get install code
