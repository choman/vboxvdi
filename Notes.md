A machine appears available when state is "FirstOnline"

After "FirstOnline", a powered off machine states are:
- Stopping
- PoweredOff
 
After "FirstOnline", a rebooted machine states are: N/A
- no state changes where seen

cloning seems to go in background?



Flow
   cloning is of latest snapshot, not current state
   Recommend:
   - applying updates to base image
   - poweroff base image
   - take snapshot in powered off state


Service - get running as root first, then vdiadmin
   - sudo -u vdiadmin vboxmanage setproperty machinefolder default|<folder> |
    sudo -i -u vdiadmin /usr/bin/vboxmanage setproperty machinefolder /vdi


Aggregates:
- It is possible to gangup the inteferfaces on ubuntu.

RAID or NFS:
- the /vdi folder is a holding place that should work for a RAID'd 
  file sysytem and/or an NFS mount point

Block device storage:
- This should work as well for the /vdi folder

- 

