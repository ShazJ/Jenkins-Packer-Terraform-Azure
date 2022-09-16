#############################################################
##  File:  helm.sh
##  Desc:  Installs and configures helm, helmfile and helmdiff
#############################################################
#!/bin/bash -x
echo "INSTALLING - Helm"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
mkdir /usr/local/share/helm

echo "INSTALLING - Helmdiff"
helm plugin install https://github.com/databus23/helm-diff

echo "INSTALLING - Helmfile"
wget -O helmfile_linux_amd64 https://github.com/roboll/helmfile/releases/download/v0.135.0/helmfile_linux_amd64
chmod +x helmfile_linux_amd64
mv helmfile_linux_amd64 /usr/local/share/helm

echo "TESTING"
if ! [ -x "$(command -v helm)" ]; then
  echo 'Error: helm is not installed.' >&2
  exit 1
fi