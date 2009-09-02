# Copyright (c) 2008-2009, the Flatsoft, LLC.
# All rights reserved


# include config
. `dirname $0`/configuration.sh


# create desc dir
mkdir -p /var/backups/mysql


# link script
copy_file $sliceconfig/config/etc/cron.daily/automysqlbackup.sh /etc/cron.daily/automysqlbackup.sh copy

# restart service
service crond reload
