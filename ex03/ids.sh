#!/usr/bin/env sh
LOG=/var/log/syslog
MYNET='192[.]168[.]13[.]'
MYNET_IFACE='eth0'
OTHER_IFACE='eth1'

alias other_logins="cat $LOG | grep 'BAD INPUT LOG'"
alias illegal_forwards="cat $LOG | grep 'BAD FORWARD LOG'"
alias forgeries="cat $LOG | grep 'FORGERY FORWARD LOG'"
alias malicious_outputs="cat $LOG | grep 'BAD OUTPUT LOG'"

function telltale
{
    echo "LOGIN ESTRANEI: $(get_other_logins | grep 'SRC=[^ ]*' -o |)"
    echo "LOGIN ESTRANEI #$(other_logins | wc -l)"
    echo "$(other_logins | grep 'SRC=[0-9.]*' -o | sort | uniq)"
    # basically just wc -l, and also uniq+sort
    # .... etc etc
}

function alarm
{
    echo alarmmmm!!!
    # maybe some watch of telltale?
    # if there are NEW ips (not number of logins) then alarm!
}

function telltale_portscans
{
    port_scans=$(cat $LOG | egrep '(BAD INPUT LOG|GOOD INPUT LOG)' | sed -r 's/^.*(SRC=[0-9.]*).*(PROTO=\w*).*(DPT=[0-9]*).*$/\1 \2 \3/' | sort | uniq)
    ips=$(echo "$port_scans" | cut -f1 -d' '| sort | uniq)
    for i in $ips
    do
        n=$(echo "$port_scans" | grep $i | wc -l)
        echo "$i -> $n"
    done

    ## IMPORTANT:
}

## TODO: clean up this ugly and inefficient shit
