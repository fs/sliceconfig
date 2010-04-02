# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create desc dir
mkdir -p /var/backups/mirror
mkdir -p /var/backups/files


# link exclude
copy_file $sliceconfig/config/etc/rdup.exclude.conf /etc/rdup.exclude.conf link


# link sysconfig
copy_file $sliceconfig/config/etc/sysconfig/rdup /etc/sysconfig/rdup link


# link script
copy_file $sliceconfig/config/etc/cron.hourly/rdup.sh /etc/cron.hourly/rdup.sh link

copy_file $sliceconfig/config/etc/logrotate.d/rdup /etc/logrotate.d/rdup link

# restart service
service crond reload
