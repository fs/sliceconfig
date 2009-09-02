# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# copy config, monit config must be a regular file
copy_file $sliceconfig/config/etc/monit.conf /etc/monit.conf copy
copy_file $sliceconfig/config/etc/monit.d/system.conf /etc/monit.d/system.conf link
copy_file $sliceconfig/config/etc/monit.d/crond.conf /etc/monit.d/crond.conf link
copy_file $sliceconfig/config/etc/monit.d/syslog.conf /etc/monit.d/syslog.conf link
copy_file $sliceconfig/config/etc/monit.d/sshd.conf /etc/monit.d/sshd.conf copy
copy_file $sliceconfig/config/etc/monit.d/sendmail.conf /etc/monit.d/sendmail.conf link
copy_file $sliceconfig/config/etc/monit.d/fs.conf /etc/monit.d/fs.conf link
copy_file $sliceconfig/config/etc/monit.d/munin-node.conf /etc/monit.d/munin-node.conf link
copy_file $sliceconfig/config/etc/monit.d/backup_files.conf /etc/monit.d/backup_files.conf link
copy_file $sliceconfig/config/etc/monit.d/backup_mirror.conf /etc/monit.d/backup_mirror.conf link
copy_file $sliceconfig/config/etc/monit.d/backup_s3.conf /etc/monit.d/backup_s3.conf link

# setup valid perms before starting
chmod -R 0600 /etc/monit.conf


# configure service
chkconfig monit on


# restart service
service monit start
