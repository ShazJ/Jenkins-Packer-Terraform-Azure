#!/bin/bash -e
echo "PROVISIONING - Python"
apt-get install -y --no-install-recommends python3 python3-pip

#apt-get -y install pypy

# python3 -m pip --version
# pip3 install pyhelm

#Test install is successful
if ! [ -x "$(command -v python)" ]; then
  echo 'Error: python is not installed.' >&2
  exit 1
fi