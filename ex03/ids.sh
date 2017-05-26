#!/usr/bin/env sh
LOG=/var/log/syslog
MYNET='192[.]168[.]13[.]'
MYNET_IFACE='eth0'
OTHER_IFACE='eth1'

other_logins=$(cat $LOG | grep 'BAD INPUT LOG')
illegal_forwards=$(cat $LOG | grep 'BAD FORWARD LOG')
forgeries=$(cat $LOG | grep 'FORGERY FORWARD LOG')
malicious_outputs=$(cat $LOG | grep 'BAD OUTPUT LOG')

function telltale
{
    echo "LOGIN ESTRANEI: $(get_other_logins | grep 'SRC=[^ ]*' -o |)"
}

