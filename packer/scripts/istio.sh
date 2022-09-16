#############################################################
##  File:  istio.sh
##  Desc:  Installs and configures istio
#############################################################
#!/bin/bash -x
echo "INSTALLING - Istio"

ISTIO_VERSION="1.9.1"
curl https://github.com/istio/istio/releases/download/$ISTIO_VERSION/istio-$ISTIO_VERSION-linux-amd64.tar.gz