#!/bin/bash

IP=192.168.2.50
IPVSADM=/sbin/ipvsadm

function list
{
    sudo $IPVSADM --list
}

function add
{
    port=$1
    echo $port
    sudo $IPVSADM -a -t ${IP}:3389 -r ${IP}:$port -m 
    exit
}

function del
{
    port=$1
    echo $port
    sudo $IPVSADM -d -t ${IP}:3389 -r ${IP}:$port 
    exit
}



function check_ipvs
{
    sudo $IPVSADM --list | grep TCP | grep 3389 2> /dev/null
    rval=$?

    echo $rval

    if [ $rval -ne 0 ]; then
        echo "hmm"
        sudo $IPVSADM -A -t ${IP}:3389 -p
    fi
}

check_ipvs


while getopts "la:d:" opt; do
    case $opt in
    l)
        list
        exit
        ;;

    a)
        add $OPTARG
        ;;
     
    d)
        del $OPTARG
        ;;

    esac

done

echo $PORT

exit

sudo ${IPVSADM} -a -t ${IP}:3389 -r ${IP}:$1 -x 1

