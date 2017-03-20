# vboxvdi

## Description

Create a VDI like implementation with VirtualBox that fully supports 
rdp'ing to any type of client (windows or linux) via virtualbox's vrdp
featyre


## Requirements
VirtualBox must be installed on server.  
Uses vRDP VirtualBox RDP server by default, should work with other RDP servers, but not tested.
The install.sh script should take care of most of the requirements but to be thorough.  This script needs the following and should install them automatically:
 
 - ipvsadm (the current broker)
 - python-pytimeparse
 - python-yaml



