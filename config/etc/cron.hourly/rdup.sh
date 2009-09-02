#!/bin/sh

# Source system configuration parameters.
. /etc/sysconfig/rdup

# remove old backups
nice -n 19 find $DESC_DIR/*/  -maxdepth 1 -ctime +$BACKUP_DAYS -type d -exec rm -rf {} \;


# perform backup
nice -n 19 /usr/bin/rdup-simple -z -E $EXCLUDE_FILE $SOURCE_DIR $DESC_DIR 1>>$LOG_FILE 2>&1


# create timestamp file
echo `date +%c` > $DESC_DIR/timestamp.txt
