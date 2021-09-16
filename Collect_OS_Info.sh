#! /bin/bash

####################################################################################
###
### Author:  KSP
###
### Usage:   Collect_info.sh
###
### Purpose: Collect basic system info
###
####################################################################################

run_cmd ()
{
echo "######## CMD $1  ########"
eval $1
echo -e "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n"
}

main ()
{
run_cmd 'date'
run_cmd 'hostname'
run_cmd 'uname -a'
run_cmd 'uptime'
run_cmd 'df -PTh | wc -l'
run_cmd 'route -n'
run_cmd 'route -n | wc -l'
run_cmd 'rpm -q kernel'
run_cmd 'fdisk -l'
run_cmd 'lsblk'
run_cmd 'for i in `ls /dev/sd* /dev/dm-* /dev/emcpower*`; do echo -e "$i - `scsi_id -g -u -d $i`"; done'
run_cmd 'cat /etc/fstab'
run_cmd 'cat /etc/mtab'
run_cmd 'mount -v'
run_cmd 'ifconfig -a'
run_cmd 'for i in $(ls /etc/sysconfig/network-scripts/ifcfg-*); do echo "$i ==>"; cat $i;echo;echo; done'
run_cmd 'ip -o a'
run_cmd 'ip -o l'
run_cmd 'ip r'
run_cmd 'pvdisplay -v'
run_cmd 'vgdisplay -v'
run_cmd 'lvdisplay -v'
run_cmd 'multipath -ll'
run_cmd '/opt/VRTSvcs/bin/hastatus -summ'
run_cmd 'cat /etc/VRTSvcs/conf/config/main.cf'
run_cmd 'vxdisk -o alldgs -e list'
run_cmd 'virsh -c qemu:///system list --all'
run_cmd 'powermt display dev=all'
run_cmd 'df -PTh'
run_cmd 'cat /etc/redhat-release'
run_cmd 'ps -ef'
run_cmd 'lsmod'
run_cmd 'netstat -ntlup'
run_cmd 'dmidecode'
run_cmd 'lshw'
run_cmd 'systool -c scsi_host -v'
run_cmd 'lspci -vv'
run_cmd 'free -h'
run_cmd 'swapon -s'
run_cmd 'lscpu'
run_cmd 'grep -v "zZzZ" -H /sys/class/fc_host/host*/*'
run_cmd 'cat /proc/cpuinfo'
run_cmd 'cat /etc/fstab'
run_cmd 'for i in $(ip -o a|egrep -v "lo|bond"|awk "{print \$2}"); do echo "$i ===>"; ethtool $i; done'
}

main  > /tmp/$(uname -n) 2>&1

echo -e "\n +++++++++++++ INFO CAPTURED TO /tmp/$(uname -n) +++++++++++++ "
