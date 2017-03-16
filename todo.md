Todo

General:
- ~~launch clones after snapshot~~
- setup as service
- ~~support config file~~
- support program logging
- clone hdd not in pool
- ~~remove idle machine if total count is > freesize~~

Snapshots:
- Currently deleting clone, reset snapshot after 1m (logged off or powered down)

VRDE
- ~~track sessions of clones~~

IPVS:
- glue to ipvsadm as machines are created
    - ~~add line to port~~
    - ~~rm line to port~~
    - check for orphaned ipvs entries and restarts

Graphical:
- clone vms to pool (group) - in GUI, already separated on disk


BUGS:
- occassional vboxmange bug
- vboxmanage timing
- need speedier snapshot - issues in pyvbox?
- memory leak


Future:
- suspend vs remove
- human readable configfile
- support persistant desktops
- assignable machines (persistance)
