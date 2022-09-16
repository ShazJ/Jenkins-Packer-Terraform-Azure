#############################################################
##  File:  kubectl.sh
##  Desc:  Installs and configures kubectl
#############################################################

#!/bin/bash -x
echo "INSTALLING - Kubectl"
KUBECTL_VERSION="kubectl-1.13.12-0.x86_64" #(curl -L -s "https://dl.k8s.io/release/stable.txt")
curl -o /usr/local/bin/kubectl -LO "https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl"
chmod +x /usr/local/bin/kubectl

echo "CONFIGURING - Kubectl"
#Create namespace for monitoring
kubectl get pods
# #Create k8s namespace helios
# kubectl create namespace helios
# #Create k8s namespace platform
# kubectl create namespace platform
# #Create k8s namespace infra
# kubectl create namespace infra

echo "TESTING"
#Test install is successful
if ! [ -x "$(command -v kubectl)" ]; then
  echo 'Error: kubectl is not installed.' >&2
  exit 1
fi