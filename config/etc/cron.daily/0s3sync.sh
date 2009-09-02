#!/bin/sh

# Source system configuration parameters.
. /etc/sysconfig/s3sync


# remove old backups
nice -n 19 find $MIRROR_DIR -ctime +$BACKUP_DAYS -type f -exec rm {} \;


# create solid tar archove with latest file backup
source_file_backup_dir=$FILE_BACKUP_DIR/`date +%Y%m`/`date +%d`
desc_file_archive=$MIRROR_DIR/files-`date +%F`.tar

if [ -d $source_file_backup_dir ]; then
  nice -n 19 tar -cf $desc_file_archive $source_file_backup_dir 1>>$LOG_FILE 2>&1
fi


# create solid tar archive with mysql backup
source_mysql_backup_dir=$MYSQL_BACKUP_DIR/latest
desc_mysql_archive=$MIRROR_DIR/mysql-`date +%F`.tar

if [ -d $source_mysql_backup_dir ]; then
  nice -n 19 tar -cf $desc_mysql_archive $source_mysql_backup_dir 1>>$LOG_FILE 2>&1
fi


# mirror backups
nice -n 19 s3sync -s -r -v --delete $MIRROR_DIR $HOSTNAME:$PREFIX 1>>$LOG_FILE 2>&1


# create timestamp file
echo `date +%c` > $MIRROR_DIR/timestamp.txt


# check integrity backup
backup_check="$MIRROR_DIR/backup.check"
upload_failed=0

# get size for uploaded backup arch
size_on_s3=$(s3sync -n -s -d $HOSTNAME:$PREFIX/mirror/files-`date +%F`.tar /tmp/ 2>&1|grep Size|head -1|awk -F":" '{print $4}'|awk '{print $1}' 2>/dev/null)

# check returned value
let k="$size_on_s3+1"
if [ $k -lt 2 ]; then
  upload_failed=1

else
  # if file on S3 exist and we got it size  

  # get local size of backup arch
  size_local=$(ls -l $MIRROR_DIR/files-`date +%F`.tar |awk '{print $5}' 2>/dev/null)

  if [ $size_on_s3 -ne  $size_local ]; then
    upload_failed=1
  fi

fi

if [ $upload_failed -eq 1 ]; then
  echo "FAILED" > $backup_check
else
  echo "SUCCESS" > $backup_check
fi
