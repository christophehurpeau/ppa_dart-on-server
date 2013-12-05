#!/bin/sh

appName = ''
while [ "$appName" = "" ]
do
	read -p "Please provide your app name: (eg: my_app) " appName
done

sudo useradd --home-dir /var/dartapps/$appName -g dart --create-home --shell /bin/bash "dart-$appName"

if [ ! -d /var/dartapps/$appName ]; then
	echo "User creation failed"
	exit 1;
fi

read -p "Url of the repository to clone (just press enter if none)" repo

if [ "$repo" != "" ]; then
	sudo su "dart-$appName" -s "git clone '$repo' '/var/dartapps/$appName/app/'"
fi
