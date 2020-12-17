#!/bin/bash

function get_ram_info()
{
	ram_info=`free -h | grep "Mem:" | awk '{ print "Total: \t" $2 "\n" "Free: \t" $4 "\n" "Used: \t" $3 } '`
	echo "$ram_info"
}

if [ $# -eq 0 ]
then
	echo -e "Please specify an argument."
	exit 1
fi

if [ $1 = "-r" ]
then
	ram_info="$(get_ram_info)"
        echo "$ram_info"	
fi


exit 0

