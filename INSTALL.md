# Installation

## Install Steps

After a clean install of ubuntu:

- sudo apt-get update; sudo apt-get install -y git ssh
- git clone https://github.com/choman/vboxvdi
- cd vboxvdi
- ./install.sh - the system will reboot when finished

NOTE: you may need to enter the admin passwd multiple times


## Post-Install Steps

- log in to our account
- xhost + 
- sudo -i -u vdiadmin
- virtualbox
- create a machine
    - ubuntu based 
    - 4096 G Ram
    - 28G HDD (at least) - NOTE: does not appear to take more than 6 when done
    - 2 cores
    - Enable PAE/NX if Applicable 
    - Boot order (HDD, cdrom)
    - storage - select the ubuntu mate iso from your ISO location
    - All other settings should be fine

- power on vm and install
- after install, remember the account used during install
  follow client desktop install and return here when done

## VM Post-Install Steps
- after install and the baseimage looks the way you want 
- powerdown and take a snapshot
- cd /opt/vboxvdi
- cp config.yml.tmpl config.yml
- edit the config.yml
    - enter the account info from above
    - enter the base image name
    - adjest any other settings
- save file
- VMs should start cloning


