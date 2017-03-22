#!/bin/bash

IPVSADM=/sbin/ipvsadm

function list
{
    sudo $IPVSADM --list
    exit
}

function clear
{
    sudo $IPVSADM -C
    exit
}

function add
{
    IP=$1
    port=$2

    echo "add: $IP:3389 --> $IP:$port"
    sudo $IPVSADM -a -t ${IP}:3389 -r ${IP}:$port -m -x 1
    exit
}

function del
{
    IP=$1
    port=$2

    echo "del: $IP:3389 --> $IP:$port"
    sudo $IPVSADM -d -t ${IP}:3389 -r ${IP}:$port 
    exit
}

function usage
{
    echo "usage: $0 -t <ip> -a <port>"
    echo "       $0 -t <ip> -d <port>"
    echo 
    echo "       $0 -l  - list  tables"
    echo "       $0 -c  - clear tables"
    exit
}

function check_ipvs
{
    IP=$1

    sudo $IPVSADM --list | grep TCP | grep 3389 2> /dev/null
    rval=$?

    if [ $rval -ne 0 ]; then
        sudo $IPVSADM -A -t ${IP}:3389 -p
    fi
}

if [ "$1" = "" ]; then 
    usage
fi

while getopts "lct:a:d:h" opt; do
    case $opt in
    l)
        list
        ;;

    c)
        clear
        ;;

    t)
        check_ipvs $OPTARG
        IP=$OPTARG
        ;;

    a)
        add $IP $OPTARG
        ;;
     
    d)
        del $IP $OPTARG
        ;;

    h) 
        usage
        ;;

    esac

done

echo $IP
echo $PORT

