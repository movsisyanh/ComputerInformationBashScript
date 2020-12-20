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
	cpu_mhz=`grep -i "cpu mhz" /proc/cpuinfo | awk 'NR == 1 {print $4}'`
	cpu_mhz=`echo "scale=1; $cpu_mhz/1000" | bc`
	
	cpu_cores=`grep "cpu cores" /proc/cpuinfo | awk 'NR==1 {print $4 }'`	
	
	cpu_cache=`grep "cache size" /proc/cpuinfo | awk 'NR==1 {print $4 }'`	
	cpu_cache=`echo "scale=1; $cpu_cache/1024" | bc`
	
	cpu_name=`grep "model name" /proc/cpuinfo | awk 'NR==1 {print $4 $5 $6 }'`	

	cpu_vendor=`grep "vendor_id" /proc/cpuinfo | awk 'NR==1 {print $3 }'`	
	
	echo "CPU vendor name:    $cpu_vendor" 
	echo "CPU name:           $cpu_name "
	echo "CPU frequency:      $cpu_mhz Ghz "
	echo "CPU cores:          $cpu_cores"
	echo "CPU caches size:    $cpu_cache Mb"
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
	
elif [ $1 = "-c" ]
then 
	get_cpu_information
fi


exit 0

