#!/bin/bash

git pull --rebase

./gfwlist2dnsmasq.sh -s gfwlist -o dnsmasq_gfwlist_ipset.conf -i --extra-domain-file speed.txt
grep '^server='       dnsmasq_gfwlist_ipset.conf > dnsmasq_gfwlist_server.conf
sed -i '/^server=/d' dnsmasq_gfwlist_ipset.conf

for emm in `ls *.conf`
do
    md5sum $emm|cut -d' ' -f1>$emm.md5
done

git commit -am "auto updated conf file on `date`"
git push

