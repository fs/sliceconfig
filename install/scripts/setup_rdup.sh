# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create desc dir
mkdir -p /var/backups/mirror
mkdir -p /var/backups/files


# copy exclude
copy_file $sliceconfig/config/etc/rdup.exclude.conf /etc/rdup.exclude.conf


# copy sysconfig
copy_file $sliceconfig/config/etc/sysconfig/rdup /etc/sysconfig/rdup


# copy script
copy_file $sliceconfig/config/etc/cron.hourly/rdup.sh /etc/cron.hourly/rdup.sh

copy_file $sliceconfig/config/etc/logrotate.d/rdup /etc/logrotate.d/rdup

# restart service
service crond reload
