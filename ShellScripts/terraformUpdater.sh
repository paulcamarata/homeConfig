#!/bin/bash
if [ -f /usr/bin/terraform ]; then
    localVersion=$(terraform --version | cut -d "v" -f 2)
else
    localVersion="Not_Installed"
fi

remoteVersion=$(curl -s https://releases.hashicorp.com/terraform/ | grep '<a href="/terraform' | head -1 | cut -d '/' -f 3)

#echo -e '\t'"local  = $localVersion" #debug 
#echo -e '\t'"remote = $remoteVersion" #debug

fileName='terraform_'$remoteVersion'_linux_amd64.zip'

if [[ $localVersion == $remoteVersion ]]; then
    echo "Current Version v" $localVersion "detected, No Change"
else
    echo "Updating to " $remoteVersion
    cd ~/Downloads && curl -O 'https://releases.hashicorp.com/terraform/'"$remoteVersion"'/'"$fileName" > /dev/null 2> /dev/null
    sudo unzip ~/Downloads/$fileName -d /usr/bin/ > /dev/null 2> /dev/null
    
    if [ -d ~/Documents/terraform-templates ]; then
        cd ~/Documents/terraform-templates
    else
        mkdir ~/Documents/terraform-templates && cd ~/Documents/terraform-templates
    fi

    touch template.tf
    terraform apply
fi

if [ ! -f /usr/bin/terraform ]; then
        echo "Installation Failed"
fi
