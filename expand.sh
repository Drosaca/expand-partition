#!/bin/bash
set -e
if [[ $1 = "-h" ]] || [[ -z $1  ]] || [[ -z $2 ]]
then
	echo " usage: ./expand.sh [disk]     [partition]"
	echo " eg:    ./expand.sh /dev/loop0  /dev/loop0p2"
	exit 0
fi
disk=${1}
part=${2}
partnb=$(echo $part | grep -o "[0-9]*$")
err=$(echo -e "\033[0;31mError: Fail to resize the system is now unstable don't reboot! you should restore the partitions manually before with sfdisk $disk < recovery.save \033[0m")
sudo sfdisk -d $disk > recovery.save
sudo parted $disk resizepart $partnb 100% || (echo -e $err; exit 1)
sudo partprobe $disk || (echo -e $err; exit 1)
sudo resize2fs $part || (echo -e $err; exit 1)
echo done