#!/bin/bash
if [ -f /usr/bin/terraform ]; then
    localVersion=$(terraform --version | cut -d "v" -f 2)
else
    localVersion="Not_Installed"
fi

remoteVersion=$(curl https://releases.hashicorp.com/terraform/ | grep '<a href="/terraform' | head -1 | cut -d '/' -f 3)

echo "local  = $localVersion"
echo "remote = $remoteVersion"
fileName='terraform_'$remoteVersion'_linux_amd64.zip'

echo $filePath

if [ $localVersion == $remoteVersion ]; then
    echo "Current Version " $localVersion "detected, No Change"
else
    echo "Updating to " $remoteVersion
    cd ~/Downloads && curl -O 'https://releases.hashicorp.com/terraform/'"$remoteVersion"'/'"$fileName"
    sudo unzip ~/Downloads/$fileName -d /usr/bin/
fi

if [ -f /usr/bin/terraform ]; then
    terraform --version
else
    echo "Installation Failed"
fi
