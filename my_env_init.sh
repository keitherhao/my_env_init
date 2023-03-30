#!/bin/sh

echo "Start exec $0"

echo "Start exec $0"
issue="`awk '{print $1}' /etc/issue`"
echo $issue
if [ "$tmp" = "Debian" ];then
	echo "Is Debian."
	./Debian.sh
elif [ "$tmp" = "Arch" ];then
	echo "Is Arch."
	./Debian.sh
fi

echo "End exec $0"

exit 0
