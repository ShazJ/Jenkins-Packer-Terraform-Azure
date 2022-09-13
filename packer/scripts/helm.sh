#!/bin/bash
echo "PROVISIONING - Helm"
curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash

#Test install is successful
if ! [ -x "$(command -v helm)" ]; then
  echo 'Error: helm is not installed.' >&2
  exit 1
fi