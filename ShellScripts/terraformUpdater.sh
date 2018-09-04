#!/bin/bash

version=$(curl https://releases.hashicorp.com/terraform/ | grep '<a href="/terraform' | head -1 | cut -d '/' -f 3)

echo $version

curl -O 'https://releases.hashicorp.com/terraform/'"$version"'/terraform_'"$version"'_linux_amd64.zip'
