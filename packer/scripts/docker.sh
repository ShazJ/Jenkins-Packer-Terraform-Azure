#!/bin/bash
echo "PROVISIONING - Docker"
apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

apt-get update
apt-get install docker-ce docker-ce-cli containerd.io

# Install docker-compose v1 from releases
URL="https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64"
curl -L $URL -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose