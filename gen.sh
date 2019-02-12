#!/bin/bash

git pull --rebase

./gfwlist2dnsmasq.sh -s gfwlist -o dnsmasq_gfwlist_ipset.conf -i --extra-domain-file speed.txt
grep '^server='       dnsmasq_gfwlist_ipset.conf > dnsmasq_gfwlist_server.conf
sed -i '/^server=/d' dnsmasq_gfwlist_ipset.conf
cat *.conf|md5sum|cut -d' ' -f1>conf.md5
git commit -am "auto updated conf file on `date`"
git push

