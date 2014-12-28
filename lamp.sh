#!/bin/bash

# Check if user has root priveleges
if [[ $EUID == "0" ]]; then
    echo "Please don't run $0 as root, it will use sudo commands when you need to elevate priveleges."
    exit 1
fi

# Make sure package database is up to date
sudo apt-get update

# Install the packages:
#
#  	 	apache2 (webserver)
#		mysql-server (database)
# 		php5 (Scripting language)
# 		php5-mysql (package to allow php and mysql to interact)
# 		php5-imap (package to handle interactions with IMAP mail servers)
# 		php5-curl (package including cURL wrappers to make HTTP Requests)

sudo apt-get install apache2 mysql-server php5 php5-mysql php5-imap php5-curl
ip=`ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/'`

echo "Installation Complete! Check $ip:80 to verify everything is operational"