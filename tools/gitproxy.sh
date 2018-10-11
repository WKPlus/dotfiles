
function help
{
    cat << EOF
Usage: $0 [set|unset]
EOF
}

function set_git_proxy
{
    echo "set git https.proxy as 'socks5://127.0.0.1:1080'"
    git config --global https.proxy 'socks5://127.0.0.1:1080'
    git config --global http.proxy 'socks5://127.0.0.1:1080'
    git config --global --list
}

function unset_git_proxy
{
    echo "unset git https.proxy"
    git config --global --unset https.proxy
    git config --global --unset http.proxy
    git config --global --list
}

function main
{
    action=$1
    if [[ "$action" == "set" ]];then
        set_git_proxy
    elif [[ "$action" == "unset" ]];then
        unset_git_proxy
    else
        help
    fi
}

main $@
