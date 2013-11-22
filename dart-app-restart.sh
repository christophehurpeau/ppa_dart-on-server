#!/bin/sh

appName = ''
while [ "$appName" = "" ]
do
	read -p "Please provide your app name: " appName
done

script = ''
read -p "Please provide your script in bin/: [server.dart]" script
if [ "$script" = "" ]; then
	script = 'server.dart'
fi

sudo su "dart-$appName" -s "killall dart ; cd '/var/dartapps/$appName/app/' && dart bin/$script"
