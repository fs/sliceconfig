#!/bin/sh

# Where file backups store
BACKUP_DIR="/var/backups/monthly"

# Prefix for files
PREFIX="/monthly"

cp `ls -1 /var/backups/mirror/*mysql*|head -n 1` /var/backups/monthly/
cp `ls -1 /var/backups/mirror/*files*|head -n 1` /var/backups/monthly/

s3sync -s -r -v $BACKUP_DIR $HOSTNAME:$PERFIX 1 >> /var/log/s3m.log 2>&1

rm /var/backups/monthly/*