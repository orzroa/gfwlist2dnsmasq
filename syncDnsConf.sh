#!/bin/sh

result=1
cd /etc/dnsmasq.d

for emm in  `ls *.conf`
do
  mget https://raw.githubusercontent.com/orzroa/gfwlist2dnsmasq/master/$emm
  result=`expr $result \* $?`
  echo "result=$result"
done

if [ $result -eq 0 ]; then
  /etc/init.d/dnsmasq restart
fi

