#!/bin/bash -e
echo "PROVISIONING - Support Packages"

echo set debconf to Noninteractive
echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Update apt-get package list
apt-get update

declare -a common_packages=(
    "apt-transport-https" 
    "curl" 
    "gpg" 
    "jq" 
    "git"
    "software-properties-common"
    )

apt -y update && apt-get -y upgrade

for package in $common_packages; 
do
    echo "INSTALL $package"
    apt-get install -y $package
done