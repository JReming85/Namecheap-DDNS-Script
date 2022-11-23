#!/bin/bash

host="subdomain"
domain="domain.com"
pass="supersecretpassword"
url="https://dynamicdns.park-your-domain.com/update?host=$host&domain=$domain&password=$pass&ip="

# Google DNS to My IP
ipcheck1=$(dig TXT +short o-o.myaddr.l.google.com @ns1.google.com)
# OpenDNS DNS to My IP
ipcheck2=$(dig +short myip.opendns.com @resolver1.opendns.com)

# Remove " From IP
ip=$(echo $ipcheck1 |sed 's/"//g')

# Check for valid IP, if not use other DNS service
if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]]; then
echo "google worked $ip"
curl $url$ip

else

ip=$(echo $ipcheck2 |sed 's/"//g')
echo "Using OpenDNS $ip"
curl $url$ip

fi
