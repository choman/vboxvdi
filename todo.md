Todo

General:
- H: install.sh script
- H: setup as service
- H: baseimage update flow
- M: clone hdd not in pool
- M: Link vs Machine clones
- L: add logging as I go
- ~~H: support program logging~~
- ~~L: capture ctrl-c errors~~
- ~~launch clones after snapshot~~
- ~~support config file~~
- ~~remove idle machine if total count is > freesize~~


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
- H: initial clone is creating as script is moving forward, need blocker
     - false i think, api does a wait_for_completion
- H: need speedier snapshot - issues in pyvbox?
- H: memory leak?
- occassional vboxmange bug
- vboxmanage timing
- free machine > freesize may wack all machines to freesize

TEST:
- persistance of powered off vms
- persistance of logged off vms
- recyle of logged off machine
- recyle of powered off machine
- human readable configfile, for times

Future:
- H: thread cloning process - others?
- M: Look at Pool functionality
- M: suspend vs remove
- M: human readable computer terms, such as 2M
- M: packer support
- L: assignable machines (persistance)
- L: multipool support
- ~~human readable configfile~~
- ~~M: support persistant desktops~~
