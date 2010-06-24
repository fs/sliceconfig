#!/bin/sh

. /etc/sysconfig/s3sync

SAVE_DAY=$(( `date +%d` - $BACKUP_DAYS ))
SAVE_DATE=`date +%Y-%m`-$SAVE_DAY

#delete old files
for f in `s3cmd list $HOSTNAME|grep files|grep -B 99 $SAVE_DATE`; do
    `s3cmd delete $HOSTNAME:$f` 2>&1 >> $LOG_FILE
done
  
#..and mysql db
for f in `s3cmd list $HOSTNAME|grep mysql|grep -B 99 $SAVE_DATE`; do
    `s3cmd delete $HOSTNAME:$f` 2>&1 >> $LOG_FILE
done
