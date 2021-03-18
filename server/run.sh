#!/bin/bash
echo "Starting nagios..."
/usr/local/nagios/bin/nagios -d /usr/local/nagios/etc/nagios.cfg
echo "Starting apache2..."
apachectl -D FOREGROUND
