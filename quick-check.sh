#!/bin/bash
#Updated by KSP
read -p 'FileName:' myfile
read -p 'Subject:' mysub
read -p 'USER:' myuser
read -p 'Inventory:' myinv

echo "Starting Ansible"
ansible -i $myinv all -m shell -a "dmidecode -t system | grep  'Product Name'  && echo ';' && cat /etc/redhat-release && echo ';' && df -PTh | wc -l && echo ';' && ip a | wc -l && echo ';' &&  route -n | wc -l && echo ';' &&  mount | wc -l && echo ';' &&  uptime &&  echo ';' && uname -r"  -u $myuser --ask-pass --become --ask-sudo-pass > $myfile

echo "Starting File Formating"
cat $myfile | xargs |sed 's/ | SUCCESS | rc=0 >>/;/g' | sed 's/Red Hat Enterprise Linux Server release/RHEL/g' | sed 's/x86_64/&\n/g' | sed 's/Product Name: //g' > "$myfile".txt

echo "Sending mail"
echo "$mysub" | mailx  -S smtp=<SMTPIP> -s "$mysub" -a ./"$myfile".txt <emailID>
