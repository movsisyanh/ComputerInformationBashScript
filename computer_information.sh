#!/bin/bash

function show_help(){
	echo " -a/--all - Print whole information"
	echo " -c - Show CPU information."
	echo " -r - Show RAM information."
	echo " -d - Show Disk information."
	echo " -e - Show external device information."
	echo " -v - Show video information."
	echo " -m - Show Motherboard information."
	echo " -o - Show OS information."
	echo " -h - Show help flags, usage example."
}

function show_all_information(){
	echo "f"
}

function get_ram_info(){
	ram_info=`free -h | grep "Mem:" | awk '{ print "Total: \t" $2 "\n" "Free: \t" $4 "\n" "Used: \t" $3 } '`
	echo "$ram_info"
}

function get_cpu_information(){
	echo "f"
}

function get_disk_information(){
	echo "f"
}

function get_usb_information(){
	echo "f"
}

function get_disk_information(){
	echo "f"
}

function get_video_information(){
	echo "f"
}

function get_motherboard_information(){
	echo "f"
}

function get_os_information(){
	echo "f"
}


if [ $# -eq 0 ]
then
	echo -e "Please specify an argument."
	show_help
	exit 1
fi

if [ $1 = "-r" ]
then
	ram_info="$(get_ram_info)"
        echo "$ram_info"	
elif [ $1 = "-h" ]
then
	show_help
	
fi


exit 0

