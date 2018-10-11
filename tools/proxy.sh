#!/bin/bash

action=${1:-"unset"}

function install
{
    echo "set proxy"
    export http_proxy=http://localhost:8118
    export ALL_PROXY=$http_proxy
}

function uninstall
{
    echo "unset proxy"
    unset http_proxy
    unset ALL_RPOXY
}

if [ "$action" = "set" ];then
    install
else
    uninstall
fi
