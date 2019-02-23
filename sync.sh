#!/bin/sh

result=1
cd /etc/dnsmasq.d

mget https://raw.githubusercontent.com/orzroa/gfwlist2dnsmasq/master/dnsmasq_gfwlist_ipset.conf
result=`expr $result \* $?`
echo "result=$result"

mget https://raw.githubusercontent.com/orzroa/gfwlist2dnsmasq/master/dnsmasq_gfwlist_server.conf
result=`expr $result \* $?`
echo "result=$result"

if [ $result -eq 0 ]; then
  /etc/init.d/dnsmasq restart
fi

