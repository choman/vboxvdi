Todo

Document

General:
- TAGGED H: setup as service
- TAGGED M: clone hdd not in pool (link vs machine clones)
- TAGGED M: Link vs Machine clones
- TAGGED L: add logging as I go
- ~~H: baseimage update flow~~
- ~~H: support program logging~~
- ~~L: capture ctrl-c errors~~
- ~~launch clones after snapshot~~
- ~~support config file~~
- ~~remove idle machine if total count is > freesize~~

INSTALL:
- TAGGED ~~L: completions~~
- TAGGED ~~L: cheat~~
- ~~H: install.sh script~~
- ~~M: vbox~~
- ~~M: lynis~~
- ~~M: meld~~
- ~~L: packer~~

Update --> Reclone: Issues from "baseimage update flow"
- TAGGED M: update clones only when base is powered off
- ~~H: machines in use have issue when become not in use, crashes script~~
- ~~M: Need a way to track used machines if script/servie is restarted~~

Snapshots:
- ~~H: reset snapshot after 1m (logged off or powered down)~~

VRDE
- ~~track sessions of clones~~

IPVS:
- ipvs stuff
- TAGGED ~~glue to ipvsadm as machines are created~~
    - ~~add line to port~~
    - ~~rm line to port~~
    - TAGGED ~~M: check for orphaned ipvs entries and restarts~~

Graphical:
- TAGGED L: clone vms to pool (group) - in GUI, already separated on disk

Unseen Issues:
- TAGGED ~~traking reclones may have issue is dict contains ghost mchines~~

BUGS:
- TAGGED ~~free machine > freesize may wack all machines to freesize~~
- TAGGED ~~H: initial clone is creating as script is moving forward, need blocker~~
     - ~~false i think, api does a wait_for_completion~~
- TAGGED ~~H: memory leak?~~
- TAGGED ~~H: need speedier snapshot - issues in pyvbox?~~
- TAGGED ~~occassional vboxmange bug~~
- TAGGED ~~vboxmanage timing~~

TEST:
- persistance of powered off vms
- persistance of logged off vms
- recyle of logged off machine
- recyle of powered off machine
- human readable configfile, for times

Future:
- TAGGED ~~Performace enhancements~~
- TAGGED ~~H: thread cloning process - others?~~
- TAGGED ~~M: human readable computer terms, such as 2M~~
- TAGGED ~~M: Look at Pool functionality~~
- TAGGED ~~M: suspend vs remove~~
- TAGGED ~~L: assignable machines (persistance)~~
- TAGGED ~~L: multipool support~~
- ~~M: packer support~~
- ~~human readable configfile~~
- ~~M: support persistant desktops~~
