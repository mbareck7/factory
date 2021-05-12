#!/bin/bash

#backup paths, folders & files
<<<<<<< HEAD
folders=("/opt/apps" "/var/log")
files=("/etc/fail2ban/jail.local" "/home/mbareck/test" "/home/mbareck/test2")

cdate=$(date +%F:%T) #current date
if [ ! -f /usr/bin/rsync ]; then
        sudo apt install -y rsync
fi

#local backup, backup config and data into ~/backup/ folder
#backup files
for file_ in "${files[@]}";do
 rsync -vuzar $file_ ~/backup/
done


#backup folders
for folder_ in "${folders[@]}";do
 rsync -vuzar $folder_ ~/backup/
done