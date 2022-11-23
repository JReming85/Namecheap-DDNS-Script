# Namecheap-DDNS-Script

Simple bash script to get your current IP and update Namecheap.com's DDNS

You can further setup a cron to run and auto update

e.g. Have it run every 30 minutes
First chmod +x ./namecheap.sh or you can prepend with /bin/bash namecheap.sh
Then `nano /etc/crontab`

`*/30 * * * *  <user>  /<path to script>/namecheap.sh'

Adjust the above to look like this
'*/30 * * * *  root  /opt/namecheap.sh`
