#############################################################
##  File:  cleanup.sh
##  Desc:  Cleans up
#############################################################
#!/bin/bash -x
echo "PROVISIONING - Cleanup"

# Apt
apt -y autoremove
apt -y update