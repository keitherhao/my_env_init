#!/bin/sh

echo "Start exec $0"
issue="`awk '{print $1}' /etc/issue`"
echo $issue
if [ "$issue" = "Debian" ];then
	echo "Is Debian."
	./Debian.sh
elif [ "$issue" = "Arch" ];then
	echo "Is Arch."
	./Arch.sh
fi

echo "End exec $0"

exit 0
