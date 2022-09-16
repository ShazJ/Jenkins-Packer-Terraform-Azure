#############################################################
##  File:  python.sh
##  Desc:  Installs and configures python,openshift,pyhelm
#############################################################
#!/bin/bash -x

echo "INSTALLING - Python, openshift, pyhelm"
while fuser -s /var/lib/dpkg/lock; do sleep 1; done; apt install -y --no-install-recommends python3-pip python3-pygit2 python3-software-properties

python3 -m pip --version 

python3 -m pip install --upgrade pip

pip install openshift
pip install urllib3
pip install pyhelm

echo "TESTING"
#Test install is successful
if ! [ -x "$(command -v python)" ]; then
  echo 'Error: python is not installed.' >&2
  exit 1
fi