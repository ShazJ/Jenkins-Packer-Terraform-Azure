#############################################################
##  File:  basic.sh
##  Desc:  Sets up and installs standard required packages
#############################################################
#!/bin/bash -x
echo "PROVISIONING - Setup"

echo set debconf to Noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

apt -y update
apt -y upgrade

echo "INSTALLING - Support Packages"
common_packages=(
    "apt-transport-https" 
    "curl" 
    "gpg" 
    "git"
    "jq" 
    "software-properties-common"
    )

for package in ${common_packages[@]}; do
    echo "Install $package"
    apt install -y --no-install-recommends $package
done

