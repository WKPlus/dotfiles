#!/bin/bash

#find host in a scp command
for param in "$@"
do 
    if echo ${param} | grep "@.*:" >/dev/null; then
        host=$(echo ${param} | sed -E 's/.*@(.*):.*/\1/')
        break
    fi
done

if [[ "${host}" != "" ]];then
    #test port in list one by one
    ports=(22 58422)
    for p in ${ports[@]}
    do 
        if nc -z -w3 ${host} ${p} >/dev/null; then
            port=${p}
            break
        fi
    done
fi

if [[ "${port}" != "" ]];then
    \scp -P ${port} $@
else
    \scp $@
fi
