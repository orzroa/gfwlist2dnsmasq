#!/bin/bash

git pull --rebase

./gfwlist2dnsmasq.sh -d 127.0.0.1 -p 5353 -s gfwlist -o dnsmasq_gfwlist_ipset.conf -i
cat *.conf|md5sum|cut -d' ' -f1>conf.md5
git commit -am "auto updated conf file on `date`"
git push

