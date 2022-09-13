#!/bin/bash -eux
echo "PROVISIONING - Cleanup"
# Apt
apt -y autoremove
apt -y update