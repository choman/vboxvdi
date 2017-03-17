Todo

General:
- ~~launch clones after snapshot~~
- H: setup as service
- ~~support config file~~
- H: support program logging
- M: clone hdd not in pool
- ~~remove idle machine if total count is > freesize~~
- H: baseimage update flow
- M: Link vs Machine clones

Snapshots:
- ~~H: reset snapshot after 1m (logged off or powered down)~~

VRDE
- ~~track sessions of clones~~

IPVS:
- ipvs stuff
- glue to ipvsadm as machines are created
    - ~~add line to port~~
    - ~~rm line to port~~
    - M: check for orphaned ipvs entries and restarts

Graphical:
- L: clone vms to pool (group) - in GUI, already separated on disk


BUGS:
- occassional vboxmange bug
- vboxmanage timing
- H: need speedier snapshot - issues in pyvbox?
- H: memory leak
- M: free machine > freesize mayu wack all machines to freesize


Future:
- M: suspend vs remove
- ~~human readable configfile~~
- M: human readable computer terms, such as 2M
- M: support persistant desktops
- L: assignable machines (persistance)
- H: thread cloning process - others?
- H: Look at Pool functionality
- M: packer support
- L: multipool support
