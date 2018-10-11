#!/bin/bash

source _lib/command_timeout.sh
source _lib/color_code.sh

server_list=perf_ips

while read ip app
do
#  if ping -c2 $ip >/dev/null 2>&1
#  then
# -- host up check costs too much time
# comment it for now and assume all hosts up --!
    port_status=`nmap -p 4080 $ip | sed -n '6p' | awk '{print $2}'`
    if [ "$port_status" == "open" ]
    then
	  json=`timeout 1 "curl -s http://$ip:4080/services.status"`
	  if [ $? == 0 ]
	  then
		service_status=`echo $json | jq -r .status`
		if [[ $service_status == "ok" ]] || [[ $service_status == "publishing" ]]
		then
		  printf "${green}%-16s %-32s %-8s${nc}\n" $ip $app $service_status
		else
		  printf "${red}%-16s %-32s %-8s${nc}\n" $ip $app $service_status
		fi
      else
        printf "${light_red}%-16s %-32s %s${nc}\n" $ip $app "fail"
	  fi
    elif [ "$port_status" == "closed" ]
    then
      printf "${purple}%-16s %-32s %s${nc}\n" $ip $app "closed"
    fi
#  else
#    printf "${red}%-16s %-32s %s${nc}\n" $ip $app "host down"
#  fi
done <$server_list
