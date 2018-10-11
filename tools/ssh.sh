#!/bin/bash 
#Author: qifa.zhao@dianping.com
#Date: 2013-07-18

ports=(22 58422)

if echo "$1" |grep "@" >/dev/null; then
    host=${1#*@}

    for p in ${ports[@]}
    do 
        if nc -z -w3 ${host} ${p} >/dev/null; then
            port=${p}
            break
        fi
    done

    if [[ "$port" != "" ]];then
        \ssh -p ${port} $@
    else 
        \ssh $@
    fi
else
    \ssh $@
fi
