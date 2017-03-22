# vboxvdi

## Description

Create a VDI like implementation with VirtualBox that fully supports 
rdp'ing from any type of client (windows or linux), thick or thin to 
clonable persistent/non-persistance desktops via virtualbox's vrdp
feature.


## Requirements
VirtualBox must be installed on server.   
Create at least one VirtualBox VM to be used as the template.     
Edit base_image: option in config.yaml with the file name of the base VM image.
Uses vRDP VirtualBox RDP server by default, should work with other RDP servers, but not tested.   

The install.sh script should take care of most of the requirements but to be thorough.  This script needs the following and should install them automatically:
 
 - ipvsadm (the current broker)
 - python-pytimeparse
 - python-yaml
 - pyvbox

## Features:
- support persisent and non-persisiant desktops
- support rdp clients
- support defined initialized state of desktops
- support defined state of free desktops
- support defined state of maximum desktops allowed
- support removing desktops after a defined amount of idle time
- support ability to update baseimage without deploying
- support ability to deploy updated desktops w/o affecting logged on users
- support the ability to run the service and VMs as a user (non root)
- If non persistent desktops, support recycling of VMs 1m after logoff or poweroff of VM

