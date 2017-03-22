# Installation

## Install Steps

After a clean install of ubuntu:

- sudo apt-get update; sudo apt-get install -y git ssh
- git clone https://github.com/choman/vboxvdi
- cd vboxvdi
- ./install.sh - the system will reboot when finished

NOTE: you may need to enter the admin passwd multiple times


## Post-Install Steps

- install a VM for your baseimage (packer)
- take a snapshot of the baseimage
- edit the /opt/vboxvdi/config.yml
- restart service
 
