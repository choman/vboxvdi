Todo

General:
- ~~launch clones after snapshot~~
- H: setup as service
- ~~support config file~~
- H: support program logging
- clone hdd not in pool
- ~~remove idle machine if total count is > freesize~~

Snapshots:
- H: Currently deleting clone, reset snapshot after 1m (~~logged off or~~ powered down)

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
- ~~human readable configfile~~
- human readable computer terms, such as 2M
- support persistant desktops
- assignable machines (persistance)
- thread cloning process - others?
- Look at Pool functionality
- packer support
- multipool support
