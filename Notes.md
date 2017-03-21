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




