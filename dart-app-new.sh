#!/bin/sh

appName = ''
while [ "$appName" = "" ]
do
	read -p "Please provide your app name: (eg: my_app) " appName
done

sudo useradd --home-dir /var/dartapps/$appName -g dart --create-home --shell /bin/bash $appName

if [ ! -d /var/dartapps/$appName ]; then
	echo "User creation failed"
	exit 1;
fi


