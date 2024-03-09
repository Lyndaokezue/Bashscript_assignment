#!/bin/bash


#Carrying out a check to make sure the appropriate data is entered in 2 arguments
if [$# -ne 2 ]
then
        echo "Your right data usage is: backup.sh <source_dir> <Destination_dir>"
        echo  "Enter the correct arguments"
        exit 1
fi
#To access info based on Time Stamps.
currentdate=$(date +%Y-%m-%d)
rsync="-avb --backup-dir $2/$currentdate --delete"
$(which rsync) $rsync $1 $2/newbackup >>  backup_$currentdate.log
tar czf "$2/backup_$currentdate.tar.gz" -C "$1"
