#!/bin/bash
./gfwlist2dnsmasq.sh -d 127.0.0.1 -p 5353 -s gfwlist -o dnsmasq_gfwlist_ipset.conf -i
git commit -am "auto updated conf file on `date`"
git push

cp dnsmasq_gfwlist_ipset.conf /var/www/html/
