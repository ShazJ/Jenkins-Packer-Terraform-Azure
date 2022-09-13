#!/bin/bash -e
echo "PROVISIONING - Kubectl"
KUBECTL_VERSION=$(curl -L -s "https://dl.k8s.io/release/stable.txt")
curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl"
chmod +x /usr/local/bin/kubectl

#Test install is successful
if ! [ -x "$(command -v kubectl)" ]; then
  echo 'Error: kubectl is not installed.' >&2
  exit 1
fi